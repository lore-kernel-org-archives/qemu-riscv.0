Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nUTRa-00031q-6U
	for mharc-qemu-riscv@gnu.org; Wed, 16 Mar 2022 09:12:02 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nUTRV-0002uy-QK; Wed, 16 Mar 2022 09:12:00 -0400
Received: from [2a00:1450:4864:20::331] (port=36715
 helo=mail-wm1-x331.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nUTRS-0002Cp-Db; Wed, 16 Mar 2022 09:11:57 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 n31-20020a05600c3b9f00b003898fc06f1eso3201453wms.1; 
 Wed, 16 Mar 2022 06:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=2i83XDmm2Ev/BgrOHivtFmnY20KZApSWVPqEjlo6vMc=;
 b=I0LoEtV7ZSyQLZGg+c/ATH4O2ixcWNJOqGH0TXOK79vAFZNjBonSFVp592r0T/7Stp
 V+v8h5sbrekisgQegIG1FCeFUr22cuWgwFhHMikTRbJ45KfuWPiKQEZUaecWbjihlhrx
 MENjFnu75doFLFEX9a55JgbJOnVSV6OtSabROElRY3xK6lLAJ0aw2ZocBBCx1KmRY1VD
 648ynNf+mKMPV5CTv2HEH+9v293oTdsnnSTnEk0PsarBG61B1m+EG2Rv5QMxNLE7csxd
 stJ/6g1t4tZgZJ4JBasNOBwNeLtT4Uo9ttgG0df9r/Eq5ADZA5ynkNXA22esMLxs2Ako
 mZlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2i83XDmm2Ev/BgrOHivtFmnY20KZApSWVPqEjlo6vMc=;
 b=a1Mbvnrgx5qHe3gDKh2dBQu364y+eI3F/hgtwBAWOKaxF5FP3CzQpaIhCl/+N40/uO
 iqFy+Fr57ErAKEyKJUfVmtqbU/UM1HgHyijafBXQILkTwWGn71ODRwdyPjFDbFN3FAsy
 cOCC2LyNeVcEhl5Eco5p8vlUc3jgGAS/a1sXOhyJd/F9t2b0VfDF3YGcOajORaCTDl8Z
 suFFM9z1XMRat/jU49riL5FjiTX+62jeKfzBEqRE8gwMc7ezD7b8k6FEOjo9+ff0lmuv
 CMo6Ld0mDFhvlOB/gp771QUCoBO3X6Zah1Gd+eY/usv8mNdpc/+jmb4YA0G2qPjtUj6B
 zYAQ==
X-Gm-Message-State: AOAM5316PT3tuaB4oIeBWuDVL102NrqF5BlJtpPuOuNiLyPsbWx9sTt1
 9HnAhAf+8JxnQVaj4BbqMZ8=
X-Google-Smtp-Source: ABdhPJysxaC/TdNQa5HjTO1GOAcmUA/36gHHMfIT3uAptuoqQ0hHz0TwXQvnu9ctJ9Q0e5U7gtlggA==
X-Received: by 2002:a05:600c:1994:b0:38c:48dd:23ba with SMTP id
 t20-20020a05600c199400b0038c48dd23bamr4557931wmq.206.1647436311078; 
 Wed, 16 Mar 2022 06:11:51 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 t14-20020a05600c198e00b0038bb71518c1sm1689996wmq.42.2022.03.16.06.11.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Mar 2022 06:11:50 -0700 (PDT)
Message-ID: <e1f049be-8f98-04a3-6532-995e55fe7471@gmail.com>
Date: Wed, 16 Mar 2022 14:11:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH 10/27] Replace config-time define HOST_WORDS_BIGENDIAN
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Pavel Pisa <pisa@cmp.felk.cvut.cz>,
 Vikram Garhwal <fnu.vikram@xilinx.com>, Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eric Farman <farman@linux.ibm.com>, David Hildenbrand <david@redhat.com>,
 Peter Xu <peterx@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Laurent Vivier <laurent@vivier.eu>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Huacai Chen <chenhuacai@kernel.org>, Coiby Xu <Coiby.Xu@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "open list:Overall KVM CPUs" <kvm@vger.kernel.org>,
 "open list:ARM PrimeCell and..." <qemu-arm@nongnu.org>,
 "open list:S390 SCLP-backed..." <qemu-s390x@nongnu.org>,
 "open list:PowerPC TCG CPUs" <qemu-ppc@nongnu.org>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 "open list:virtio-blk" <qemu-block@nongnu.org>
References: <20220316095308.2613651-1-marcandre.lureau@redhat.com>
 <e709547a-a0c2-d1bd-7145-d03e9fd1776a@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <e709547a-a0c2-d1bd-7145-d03e9fd1776a@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::331
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 16 Mar 2022 13:12:01 -0000

On 16/3/22 14:04, Philippe Mathieu-Daudé wrote:
> On 16/3/22 10:53, marcandre.lureau@redhat.com wrote:
>> From: Marc-André Lureau <marcandre.lureau@redhat.com>
>>
>> Replace a config-time define with a compile time condition
>> define (compatible with clang and gcc) that must be declared prior to
>> its usage. This avoids having a global configure time define, but also
>> prevents from bad usage, if the config header wasn't included before.
>>
>> This can help to make some code independent from qemu too.
>>
>> gcc supports __BYTE_ORDER__ from about 4.6 and clang from 3.2.
>>
>> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
>> ---
>>   meson.build                             |  1 -
>>   accel/tcg/atomic_template.h             |  4 +-
>>   audio/audio.h                           |  2 +-
>>   hw/display/pl110_template.h             |  6 +--
>>   hw/net/can/ctucan_core.h                |  2 +-
>>   hw/net/vmxnet3.h                        |  4 +-
>>   include/exec/cpu-all.h                  |  4 +-
>>   include/exec/cpu-common.h               |  2 +-
>>   include/exec/memop.h                    |  2 +-
>>   include/exec/memory.h                   |  2 +-
>>   include/fpu/softfloat-types.h           |  2 +-
>>   include/hw/core/cpu.h                   |  2 +-
>>   include/hw/i386/intel_iommu.h           |  6 +--
>>   include/hw/i386/x86-iommu.h             |  4 +-
>>   include/hw/virtio/virtio-access.h       |  6 +--
>>   include/hw/virtio/virtio-gpu-bswap.h    |  2 +-
>>   include/libdecnumber/dconfig.h          |  2 +-
>>   include/net/eth.h                       |  2 +-
>>   include/qemu/bswap.h                    |  8 ++--
>>   include/qemu/compiler.h                 |  2 +
>>   include/qemu/host-utils.h               |  2 +-
>>   include/qemu/int128.h                   |  2 +-
>>   include/ui/qemu-pixman.h                |  2 +-
>>   net/util.h                              |  2 +-
>>   target/arm/cpu.h                        |  8 ++--
>>   target/arm/translate-a64.h              |  2 +-
>>   target/arm/vec_internal.h               |  2 +-
>>   target/i386/cpu.h                       |  2 +-
>>   target/mips/cpu.h                       |  2 +-
>>   target/ppc/cpu.h                        |  2 +-
>>   target/s390x/tcg/vec.h                  |  2 +-
>>   target/xtensa/cpu.h                     |  2 +-
>>   tests/fp/platform.h                     |  4 +-
>>   accel/kvm/kvm-all.c                     |  4 +-
>>   audio/dbusaudio.c                       |  2 +-
>>   disas.c                                 |  2 +-
>>   hw/core/loader.c                        |  4 +-
>>   hw/display/artist.c                     |  6 +--
>>   hw/display/pxa2xx_lcd.c                 |  2 +-
>>   hw/display/vga.c                        | 12 +++---
>>   hw/display/virtio-gpu-gl.c              |  2 +-
>>   hw/s390x/event-facility.c               |  2 +-
>>   hw/virtio/vhost.c                       |  2 +-
>>   linux-user/arm/nwfpe/double_cpdo.c      |  4 +-
>>   linux-user/arm/nwfpe/fpa11_cpdt.c       |  4 +-
>>   linux-user/ppc/signal.c                 |  3 +-
>>   linux-user/syscall.c                    |  6 +--
>>   net/net.c                               |  4 +-
>>   target/alpha/translate.c                |  2 +-
>>   target/arm/crypto_helper.c              |  2 +-
>>   target/arm/helper.c                     |  2 +-
>>   target/arm/kvm64.c                      |  4 +-
>>   target/arm/neon_helper.c                |  2 +-
>>   target/arm/sve_helper.c                 |  4 +-
>>   target/arm/translate-sve.c              |  6 +--
>>   target/arm/translate-vfp.c              |  2 +-
>>   target/arm/translate.c                  |  2 +-
>>   target/hppa/translate.c                 |  2 +-
>>   target/i386/tcg/translate.c             |  2 +-
>>   target/mips/tcg/lmmi_helper.c           |  2 +-
>>   target/mips/tcg/msa_helper.c            | 54 ++++++++++++-------------
>>   target/ppc/arch_dump.c                  |  2 +-
>>   target/ppc/int_helper.c                 | 22 +++++-----
>>   target/ppc/kvm.c                        |  4 +-
>>   target/ppc/mem_helper.c                 |  2 +-
>>   target/riscv/vector_helper.c            |  2 +-
>>   target/s390x/tcg/translate.c            |  2 +-
>>   target/sparc/vis_helper.c               |  4 +-
>>   tcg/tcg-op.c                            |  4 +-
>>   tcg/tcg.c                               | 12 +++---
>>   tests/qtest/vhost-user-blk-test.c       |  2 +-
>>   tests/qtest/virtio-blk-test.c           |  2 +-
>>   ui/vdagent.c                            |  2 +-
>>   ui/vnc.c                                |  2 +-
>>   util/bitmap.c                           |  2 +-
>>   util/host-utils.c                       |  2 +-
>>   target/ppc/translate/vmx-impl.c.inc     |  4 +-
>>   target/ppc/translate/vsx-impl.c.inc     |  2 +-
>>   target/riscv/insn_trans/trans_rvv.c.inc |  4 +-
>>   target/s390x/tcg/translate_vx.c.inc     |  2 +-
>>   tcg/aarch64/tcg-target.c.inc            |  4 +-
>>   tcg/arm/tcg-target.c.inc                |  4 +-
>>   tcg/mips/tcg-target.c.inc               |  2 +-
>>   tcg/ppc/tcg-target.c.inc                | 10 ++---
>>   tcg/riscv/tcg-target.c.inc              |  4 +-
>>   85 files changed, 173 insertions(+), 173 deletions(-)
>>
>> diff --git a/meson.build b/meson.build
>> index f20712cb93d7..88df1bc42973 100644
>> --- a/meson.build
>> +++ b/meson.build
>> @@ -1591,7 +1591,6 @@ config_host_data.set('QEMU_VERSION_MICRO', 
>> meson.project_version().split('.')[2]
>>   config_host_data.set_quoted('CONFIG_HOST_DSOSUF', host_dsosuf)
>>   config_host_data.set('HAVE_HOST_BLOCK_DEVICE', have_host_block_device)
>> -config_host_data.set('HOST_WORDS_BIGENDIAN', host_machine.endian() == 
>> 'big')
> 
> Can we poison HOST_WORDS_BIGENDIAN definition to force cleaning old
> patches before merging them?

Now noticed elsewhere a patch #11 doing exactly that.

Addressing Halil comment in "exec/cpu-all.h":
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


