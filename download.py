import argparse
from transformers import AutoModel, AutoTokenizer


def main(model_name, local_dir):
    # 下载模型
    model = AutoModel.from_pretrained(model_name)
    model.save_pretrained(local_dir)

    # 下载 tokenizer
    tokenizer = AutoTokenizer.from_pretrained(model_name)
    tokenizer.save_pretrained(local_dir)


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='Download model and tokenizer from Hugging Face.')
    parser.add_argument('model_name', type=str, help='Name of the model to download')
    parser.add_argument('local_dir', type=str, help='Local directory where to save the model and tokenizer')

    args = parser.parse_args()
    main(args.model_name, args.local_dir)
