Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1obZrm-00065u-Pg
	for mharc-qemu-riscv@gnu.org; Fri, 23 Sep 2022 00:00:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1obZrg-00063i-Oj; Fri, 23 Sep 2022 00:00:36 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:39888)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1obZrb-0001mn-Bc; Fri, 23 Sep 2022 00:00:34 -0400
Received: by mail-pl1-x630.google.com with SMTP id f23so10660724plr.6;
 Thu, 22 Sep 2022 21:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=VlytGFcIm1JgrJcpfExN5mGwveSPrcqWTMdmLuF/Fb0=;
 b=EZA3x3G639wpSRxN93cgHj7bB6QoKMqiVWMGGotkO/0Ljc4B5gcme1a5JkayeaR+K7
 XxGRmo0nMgQ2wLdc3038Mnq8maaMEEAB0ZMM1Op3LGvMKQH51zLTSODyRLWi3PPtS3E+
 nW9ecHlV3j2xlUwNRv9IM/QsVq1FSXuoVK+aomnGZ2CIdV9GVqEt5OPKsn5K/v9+5tdm
 De+vnN/AsEel9Q4pqY4x6sbL5zZLmpF4S/gvAbpItBlwiyqPuCKVFHGfEb/T3FSANRyO
 CLsIPpGdM3XlJ79VkiujvAGXYLyAX5Nt+r/F9Mr+/AWyZ9CKrpe6SiqfgiUX1ORIYSWB
 T62A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=VlytGFcIm1JgrJcpfExN5mGwveSPrcqWTMdmLuF/Fb0=;
 b=lt+W9rjPsY724p59RsrM5eQOh8G0KxSYT4UfDWXf62sJNKvLgExKN3WgR4VhwT6fHA
 GVHlmLgyaIIA29qEYSBeW3azGCuaLnhoc+bB04lxToWCvK7VImg1Upvx5Ts367nYl2E4
 Rz4mYSY7jvJDceGMUqOcVbXd4hEf+840fe73m1c5E5oKEGzNJGoQslkNiGPkgiMo9A2l
 wPUkzBx3F6+B773zTzArJi6QXlzvpwGvF2ca2fp5Nv8oW3RW9SdqfyYgA0A6SEmok2fK
 HVzbnNspHz4/lgzdD+ozKLnaDNp0k8knnaBa5/Iu8w9+hU6I7QZyZ1abMifuPGHJQfXi
 i7IQ==
X-Gm-Message-State: ACrzQf1rhsZfFWjWMOb6pKfLTYGFrxyromca3n0++zmucImFYGEyVj3p
 7HKvyEEGiG1IqDjRtJNVGwz0MvJ9yJUcur3+80M=
X-Google-Smtp-Source: AMsMyM406K/0etA/qT0Rt/c2uWoq3rGEMQRO3H39A8RL9liYZbVE74Gm1LfviPoXCHVhk8OC7Llj/EtZAg84tFrMbP0=
X-Received: by 2002:a17:90b:1b50:b0:202:f495:6b43 with SMTP id
 nv16-20020a17090b1b5000b00202f4956b43mr19080181pjb.85.1663905625539; Thu, 22
 Sep 2022 21:00:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220922075232.33653-1-shentey@gmail.com>
In-Reply-To: <20220922075232.33653-1-shentey@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 23 Sep 2022 13:59:59 +1000
Message-ID: <CAKmqyKNmFLZ9xS25NXXPN+aVKstYp6gs0vWE3=XqMAKpuavHMA@mail.gmail.com>
Subject: Re: [PATCH] hw/riscv/sifive_e: Fix inheritance of SiFiveEState
To: Bernhard Beschow <shentey@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 qemu-stable@nongnu.org, "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=alistair23@gmail.com; helo=mail-pl1-x630.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 23 Sep 2022 04:00:37 -0000

On Thu, Sep 22, 2022 at 5:56 PM Bernhard Beschow <shentey@gmail.com> wrote:
>
> SiFiveEState inherits from SysBusDevice while it's TypeInfo claims it to
> inherit from TYPE_MACHINE. This is an inconsistency which can cause
> undefined behavior such as memory corruption.
>
> Change SiFiveEState to inherit from MachineState since it is registered
> as a machine.
>
> Fixes: 0869490b1c ("riscv: sifive_e: Manually define the machine")
>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>  include/hw/riscv/sifive_e.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/include/hw/riscv/sifive_e.h b/include/hw/riscv/sifive_e.h
> index 83604da805..d738745925 100644
> --- a/include/hw/riscv/sifive_e.h
> +++ b/include/hw/riscv/sifive_e.h
> @@ -22,6 +22,7 @@
>  #include "hw/riscv/riscv_hart.h"
>  #include "hw/riscv/sifive_cpu.h"
>  #include "hw/gpio/sifive_gpio.h"
> +#include "hw/boards.h"
>
>  #define TYPE_RISCV_E_SOC "riscv.sifive.e.soc"
>  #define RISCV_E_SOC(obj) \
> @@ -41,7 +42,7 @@ typedef struct SiFiveESoCState {
>
>  typedef struct SiFiveEState {
>      /*< private >*/
> -    SysBusDevice parent_obj;
> +    MachineState parent_obj;
>
>      /*< public >*/
>      SiFiveESoCState soc;
> --
> 2.37.3
>
>

