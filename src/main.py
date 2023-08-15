# Copied from https://github.com/facebookresearch/audiocraft/blob/main/docs/AUDIOGEN.md
import torchaudio
from audiocraft.models import AudioGen
from audiocraft.data.audio import audio_write

model = AudioGen.get_pretrained('facebook/audiogen-medium')
model.set_generation_params(duration=2)
descriptions = ['cute cry of a happy lion']
wav = model.generate(descriptions)

for idx, one_wav in enumerate(wav):
    audio_write(f'.generated/{descriptions[idx]}', one_wav.cpu(), model.sample_rate, strategy="loudness", loudness_compressor=True)
    print(f'Saved :{descriptions[idx]}')
