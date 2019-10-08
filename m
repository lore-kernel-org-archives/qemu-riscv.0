Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iHuc8-0001P7-O4
	for mharc-qemu-riscv@gnu.org; Tue, 08 Oct 2019 14:53:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42101)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@dabbelt.com>) id 1iHuc3-0001Oe-Kk
 for qemu-riscv@nongnu.org; Tue, 08 Oct 2019 14:53:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1iHuc2-0005KW-Ak
 for qemu-riscv@nongnu.org; Tue, 08 Oct 2019 14:53:35 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:46963)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1iHuc2-0005KJ-5d
 for qemu-riscv@nongnu.org; Tue, 08 Oct 2019 14:53:34 -0400
Received: by mail-pg1-f196.google.com with SMTP id b8so4415533pgm.13
 for <qemu-riscv@nongnu.org>; Tue, 08 Oct 2019 11:53:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=fsDW0tzjaqiDnhtIyUGrjXSiZZAdOdLAXXd67hwHzks=;
 b=t2+B0dje3J6VvPXSAjaRgkpgKHL+p1RMijBeZJB0HrGv4533NpvqNHktKP41CCeSjW
 f1ZpCCnuilXN0vNPiqeO5mCTyTZWcy4zCOSwbdW+MY8Y6HbCy9Jg2LtALD/Zcr7SJnKY
 VJQnK6RRKByZmOicc3s35+SVIgHhKn7fNn9R9CQjRhIh2BllM6yIMEbqiY/jFuxBuGEm
 kqFv2JV3lvVRDgi4WMp3Qmp8pvijPRC5AEifHk9v/VEXSE35pBucSoOju9ASIhDWtK3J
 PXfDphLNcIstHW6neQHypxYYhCjOQV/VgrydD/L8xgtmJHSLlz5wac3IbJd16ASG7ijw
 /CQw==
X-Gm-Message-State: APjAAAULM66ToteISFX/iGOk1bA5LLAWrJrIJ0zPBtUsiXKo4NxvoL5v
 CMrn5BLeiMS9UEZeZ3JSNA/dbw==
X-Google-Smtp-Source: APXvYqyG4GaI+j7ZvTsqBI3G2MSIJr8zxra2N/j6k0XRZEozeCkWF7y97oXktcddE3tRXrGS/IkznA==
X-Received: by 2002:a63:881:: with SMTP id 123mr9879229pgi.227.1570560812484; 
 Tue, 08 Oct 2019 11:53:32 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id 22sm17454478pfo.131.2019.10.08.11.53.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Oct 2019 11:53:32 -0700 (PDT)
Date: Tue, 08 Oct 2019 11:53:32 -0700 (PDT)
X-Google-Original-Date: Tue, 08 Oct 2019 11:39:34 PDT (-0700)
Subject: Re: [PATCH v1 28/28] target/riscv: Allow enabling the Hypervisor
 extension
In-Reply-To: <8dae4338c8938696dfcecee6e736f6b09cc82877.1566603412.git.alistair.francis@wdc.com>
CC: qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>, alistair23@gmail.com,
 Atish Patra <Atish.Patra@wdc.com>, Anup Patel <Anup.Patel@wdc.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Alistair Francis <Alistair.Francis@wdc.com>
Message-ID: <mhng-f658dc0f-4818-44d6-ae06-22a24fc09624@palmer-si-x1e>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.215.196
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 08 Oct 2019 18:53:38 -0000

On Fri, 23 Aug 2019 16:39:03 PDT (-0700), Alistair Francis wrote:
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/cpu.c | 5 +++++
>  target/riscv/cpu.h | 1 +
>  2 files changed, 6 insertions(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 06ee551ebe..39e1c130df 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -447,6 +447,9 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>          if (cpu->cfg.ext_u) {
>              target_misa |= RVU;
>          }
> +        if (cpu->cfg.ext_h) {
> +            target_misa |= RVH;
> +        }
>
>          set_misa(env, RVXLEN | target_misa);
>      }
> @@ -493,6 +496,8 @@ static Property riscv_cpu_properties[] = {
>      DEFINE_PROP_BOOL("c", RISCVCPU, cfg.ext_c, true),
>      DEFINE_PROP_BOOL("s", RISCVCPU, cfg.ext_s, true),
>      DEFINE_PROP_BOOL("u", RISCVCPU, cfg.ext_u, true),
> +    /* This is experimental so mark with 'x-' */
> +    DEFINE_PROP_BOOL("x-h", RISCVCPU, cfg.ext_h, false),
>      DEFINE_PROP_BOOL("Counters", RISCVCPU, cfg.ext_counters, true),
>      DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
>      DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index b63f1f3cdc..500496a3be 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -268,6 +268,7 @@ typedef struct RISCVCPU {
>          bool ext_c;
>          bool ext_s;
>          bool ext_u;
> +        bool ext_h;
>          bool ext_counters;
>          bool ext_ifencei;
>          bool ext_icsr;

Reviewed-by: Palmer Dabbelt <palmer@sifive.com>

