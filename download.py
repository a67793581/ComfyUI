import argparse

from transformers import AutoModel, AutoConfig, AutoTokenizer, GenerationConfig


def main(model_name, local_dir):
    # 加载模型配置
    # model_config = AutoConfig.from_pretrained(model_name)
    # non_default_generation_parameters = {}
    # for parameter_name, default_value in model_config._get_generation_defaults().items():
    #     if hasattr(model_config, parameter_name) and getattr(model_config, parameter_name) != default_value:
    #         non_default_generation_parameters[parameter_name] = getattr(model_config, parameter_name)
    #         delattr(model_config, parameter_name)
    #
    # # 创建 GenerationConfig
    # if non_default_generation_parameters:
    #     gen_config = GenerationConfig(**non_default_generation_parameters)
    #     gen_config.save_pretrained(local_dir)

    # 下载模型
    model = AutoModel.from_pretrained(model_name)
    model.save_pretrained(local_dir)
    # 下载 tokenizer
    tokenizer = AutoTokenizer.from_pretrained(model_name, clean_up_tokenization_spaces=True)
    tokenizer.save_pretrained(local_dir)


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='Download model and tokenizer from Hugging Face.')
    parser.add_argument('model_name', type=str, help='Name of the model to download')
    parser.add_argument('local_dir', type=str, help='Local directory where to save the model and tokenizer')

    args = parser.parse_args()
    main(args.model_name, args.local_dir)
