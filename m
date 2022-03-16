Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nUTKc-0006Z8-IE
	for mharc-qemu-riscv@gnu.org; Wed, 16 Mar 2022 09:04:50 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nUTKX-0006IC-Rl; Wed, 16 Mar 2022 09:04:45 -0400
Received: from [2a00:1450:4864:20::42c] (port=46719
 helo=mail-wr1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nUTKW-0000oZ-0d; Wed, 16 Mar 2022 09:04:45 -0400
Received: by mail-wr1-x42c.google.com with SMTP id x15so2846407wru.13;
 Wed, 16 Mar 2022 06:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ofCZ8GjQOxHvqJYPmm6ycSRJ0FVFXO58q74P6MjJCJY=;
 b=QmqoDHgYDfVzGJIukelGOZrSNPAKSikGE6p/mUnrSPLfd+t00rd4bL8WoqUaFwGU7V
 H/RwU0pR3Csh+4eECtHQPzcFa4JMMfNaxdq3Z/NwKwnq4lNlugcabf+XznZ6+uOe7PGK
 cPRJLYXbZUZND1W0g6V2shEkWtkll9Ufpcph+sqjuQG78E8bgS7BqtQTm3Nn49D39VFT
 IRAoCV2mg5XVDn6kR7o/piJ4k5BIn6UjKzeKSL6MRCDoQ8G5Fn8biZ8bmuuxrWa0Bjim
 T7lMJqqgWbjKKaboCt9I8Ajb8JlcAQ6uV3Zfthr9O15DqcUpmI8/9XNxtOWB+2L59w4p
 zviA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ofCZ8GjQOxHvqJYPmm6ycSRJ0FVFXO58q74P6MjJCJY=;
 b=NVxS3zRCFv8G3emaXV3B3lAzhccvC4DeCwRtS7lsucCDLyJkbYwQ7vIqug4VTfiwbN
 UICSrTzaxv0gfTtYgRa687POFg8Xupcvdt/HJ/VUlNYuoC17YDL6IgOagSAzlN7YApNu
 8splkMsBvlWFUcDkq/rXS1/QVJsM+qbb8tQl+z24Wf2nenoyKwooE64Dg/X/qa7J01Zh
 U1orS64AIwdpdc5HKu53Jjt/xCbwc5L03Jj6rrug9VhudD2oI2Ag2ouROVq8VG2FA+OX
 8WLs1x1DrwJULZMbe1KycyEHZY+FNUXPDF0EeGqiXCPuC0xP0gNLFIyno8aQWJxAOuXW
 VVEw==
X-Gm-Message-State: AOAM531Kt8glfN2gWpZqrSxF08okNixt6OciKAK/NEqScP484/hs2ifW
 zOd+FDR6JxgFsdeQv/cTPQ0=
X-Google-Smtp-Source: ABdhPJxi4pJPwLg5gQEw9qA5AXyEFHx7f8teXsaSNm4y1Krnytqmj14VlSyWtB8Wrjpu7lmcFwDg3Q==
X-Received: by 2002:adf:e108:0:b0:1ef:97ad:5372 with SMTP id
 t8-20020adfe108000000b001ef97ad5372mr23988130wrz.658.1647435880168; 
 Wed, 16 Mar 2022 06:04:40 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 p6-20020a5d4586000000b001f0436cb325sm1612295wrq.52.2022.03.16.06.04.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Mar 2022 06:04:39 -0700 (PDT)
Message-ID: <e709547a-a0c2-d1bd-7145-d03e9fd1776a@gmail.com>
Date: Wed, 16 Mar 2022 14:04:36 +0100
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
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220316095308.2613651-1-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
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
X-List-Received-Date: Wed, 16 Mar 2022 13:04:47 -0000

On 16/3/22 10:53, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Replace a config-time define with a compile time condition
> define (compatible with clang and gcc) that must be declared prior to
> its usage. This avoids having a global configure time define, but also
> prevents from bad usage, if the config header wasn't included before.
> 
> This can help to make some code independent from qemu too.
> 
> gcc supports __BYTE_ORDER__ from about 4.6 and clang from 3.2.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   meson.build                             |  1 -
>   accel/tcg/atomic_template.h             |  4 +-
>   audio/audio.h                           |  2 +-
>   hw/display/pl110_template.h             |  6 +--
>   hw/net/can/ctucan_core.h                |  2 +-
>   hw/net/vmxnet3.h                        |  4 +-
>   include/exec/cpu-all.h                  |  4 +-
>   include/exec/cpu-common.h               |  2 +-
>   include/exec/memop.h                    |  2 +-
>   include/exec/memory.h                   |  2 +-
>   include/fpu/softfloat-types.h           |  2 +-
>   include/hw/core/cpu.h                   |  2 +-
>   include/hw/i386/intel_iommu.h           |  6 +--
>   include/hw/i386/x86-iommu.h             |  4 +-
>   include/hw/virtio/virtio-access.h       |  6 +--
>   include/hw/virtio/virtio-gpu-bswap.h    |  2 +-
>   include/libdecnumber/dconfig.h          |  2 +-
>   include/net/eth.h                       |  2 +-
>   include/qemu/bswap.h                    |  8 ++--
>   include/qemu/compiler.h                 |  2 +
>   include/qemu/host-utils.h               |  2 +-
>   include/qemu/int128.h                   |  2 +-
>   include/ui/qemu-pixman.h                |  2 +-
>   net/util.h                              |  2 +-
>   target/arm/cpu.h                        |  8 ++--
>   target/arm/translate-a64.h              |  2 +-
>   target/arm/vec_internal.h               |  2 +-
>   target/i386/cpu.h                       |  2 +-
>   target/mips/cpu.h                       |  2 +-
>   target/ppc/cpu.h                        |  2 +-
>   target/s390x/tcg/vec.h                  |  2 +-
>   target/xtensa/cpu.h                     |  2 +-
>   tests/fp/platform.h                     |  4 +-
>   accel/kvm/kvm-all.c                     |  4 +-
>   audio/dbusaudio.c                       |  2 +-
>   disas.c                                 |  2 +-
>   hw/core/loader.c                        |  4 +-
>   hw/display/artist.c                     |  6 +--
>   hw/display/pxa2xx_lcd.c                 |  2 +-
>   hw/display/vga.c                        | 12 +++---
>   hw/display/virtio-gpu-gl.c              |  2 +-
>   hw/s390x/event-facility.c               |  2 +-
>   hw/virtio/vhost.c                       |  2 +-
>   linux-user/arm/nwfpe/double_cpdo.c      |  4 +-
>   linux-user/arm/nwfpe/fpa11_cpdt.c       |  4 +-
>   linux-user/ppc/signal.c                 |  3 +-
>   linux-user/syscall.c                    |  6 +--
>   net/net.c                               |  4 +-
>   target/alpha/translate.c                |  2 +-
>   target/arm/crypto_helper.c              |  2 +-
>   target/arm/helper.c                     |  2 +-
>   target/arm/kvm64.c                      |  4 +-
>   target/arm/neon_helper.c                |  2 +-
>   target/arm/sve_helper.c                 |  4 +-
>   target/arm/translate-sve.c              |  6 +--
>   target/arm/translate-vfp.c              |  2 +-
>   target/arm/translate.c                  |  2 +-
>   target/hppa/translate.c                 |  2 +-
>   target/i386/tcg/translate.c             |  2 +-
>   target/mips/tcg/lmmi_helper.c           |  2 +-
>   target/mips/tcg/msa_helper.c            | 54 ++++++++++++-------------
>   target/ppc/arch_dump.c                  |  2 +-
>   target/ppc/int_helper.c                 | 22 +++++-----
>   target/ppc/kvm.c                        |  4 +-
>   target/ppc/mem_helper.c                 |  2 +-
>   target/riscv/vector_helper.c            |  2 +-
>   target/s390x/tcg/translate.c            |  2 +-
>   target/sparc/vis_helper.c               |  4 +-
>   tcg/tcg-op.c                            |  4 +-
>   tcg/tcg.c                               | 12 +++---
>   tests/qtest/vhost-user-blk-test.c       |  2 +-
>   tests/qtest/virtio-blk-test.c           |  2 +-
>   ui/vdagent.c                            |  2 +-
>   ui/vnc.c                                |  2 +-
>   util/bitmap.c                           |  2 +-
>   util/host-utils.c                       |  2 +-
>   target/ppc/translate/vmx-impl.c.inc     |  4 +-
>   target/ppc/translate/vsx-impl.c.inc     |  2 +-
>   target/riscv/insn_trans/trans_rvv.c.inc |  4 +-
>   target/s390x/tcg/translate_vx.c.inc     |  2 +-
>   tcg/aarch64/tcg-target.c.inc            |  4 +-
>   tcg/arm/tcg-target.c.inc                |  4 +-
>   tcg/mips/tcg-target.c.inc               |  2 +-
>   tcg/ppc/tcg-target.c.inc                | 10 ++---
>   tcg/riscv/tcg-target.c.inc              |  4 +-
>   85 files changed, 173 insertions(+), 173 deletions(-)
> 
> diff --git a/meson.build b/meson.build
> index f20712cb93d7..88df1bc42973 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1591,7 +1591,6 @@ config_host_data.set('QEMU_VERSION_MICRO', meson.project_version().split('.')[2]
>   
>   config_host_data.set_quoted('CONFIG_HOST_DSOSUF', host_dsosuf)
>   config_host_data.set('HAVE_HOST_BLOCK_DEVICE', have_host_block_device)
> -config_host_data.set('HOST_WORDS_BIGENDIAN', host_machine.endian() == 'big')

Can we poison HOST_WORDS_BIGENDIAN definition to force cleaning old
patches before merging them?

