Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EC98C27C4F
	for <qemu-riscv@archiver.kernel.org>; Wed, 26 Jun 2024 15:18:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sMUQ1-0004Hi-OS; Wed, 26 Jun 2024 11:18:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1sMUPz-0004GJ-Mw
 for qemu-riscv@nongnu.org; Wed, 26 Jun 2024 11:18:43 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1sMUPy-0003BU-0K
 for qemu-riscv@nongnu.org; Wed, 26 Jun 2024 11:18:43 -0400
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-362f62ae4c5so476110f8f.1
 for <qemu-riscv@nongnu.org>; Wed, 26 Jun 2024 08:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1719415119; x=1720019919; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=8OZ5fCpRab4CVaAsZUgtYKdZgyzyEBByCV3sPW01Tpo=;
 b=CArr69MTCQO5mZG+JF06iZ1jblWM//y6KriZBIjbyfdI/rG1231Cd8Xvw3LEPmlcXy
 6sTp1ZrNe1zHHJOCWA8mNz5qNK7/CGcc4ogIpgMc10fqMn4i2x6wyHNo12B5Gakhhwar
 2R2burtgiMS21QhaDC2COCpPZDgzkRBkjUf7Y4GN6e0c4cMjjv+5Pwqsd4PYaiHGjS2B
 8GFOTg9gBh6pxPLgL9EXO6Gc4F8dYe45a2XHTUeQxTQ7NnDGxg3F1H6fQ5TCK4q3UJcd
 oRXeAfAg6cLHjPmsq6nCM70G6LifDPTlmOl6N8TOsadCC4XcqHND8qahCCZT6tu5cN4G
 ucwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719415119; x=1720019919;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8OZ5fCpRab4CVaAsZUgtYKdZgyzyEBByCV3sPW01Tpo=;
 b=K0ExsPtglyFwI6viUcDpKyD+gESiqLzN04K8n8IZXprAgGviPOlyaxzasPQUAvzI0f
 jepHgXiKpL7KOW+AWAcR/zQvPOXO9bxvuaUsM3yFvM1QhxZpHDrSWYWG64j6SwNX8uET
 kQLDmXs1vcL9X1lZn85Ji4qqi3M1+fNfBls1ymAOwuaT279HwZpas3kgfrolZDr+w+97
 Lxai5iLmgkj6Psvug6dfZZGN+dCF+fvrsZruoAn3wffkJoFm6f+OUO8LBoK8GilwsP8S
 rDmlYU1OWbziksFp9f5csHBOeFVKUQfsKirfvLHMZtL9PI0dE3v46BnIv+gvWg1j0MCF
 CaPQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUXp8Ad3rQOAMJ32L9lT1a7vTBWKhxJ/wu8cymwuaxqXolKNAM6QCyIPqfG0Us59FZf1qoud2pVOF3xlh5aIAWPTgYQALs=
X-Gm-Message-State: AOJu0Yw/ARiJTRXSrYf3BPoBN1lpqw3Cm5gGBRTqvxt6veKZJF8RKkAP
 wvLR9nQYHuD0zZCl/pifjQnoyHNxvsaIjqZMNuIGvivPgSa/dy6zfSb1tRtNec8=
X-Google-Smtp-Source: AGHT+IETDOjl4Gfjsk3waV8J9p4ASVJWCZNyj9GDrDIRyPTX3Ettn79833csYhPp1DHZCyLgY93kEQ==
X-Received: by 2002:a05:6000:1f8c:b0:366:df58:1fd9 with SMTP id
 ffacd0b85a97d-366e32f6c66mr13243830f8f.24.1719415119365; 
 Wed, 26 Jun 2024 08:18:39 -0700 (PDT)
Received: from localhost ([194.25.246.6]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-424c8251dc1sm29592905e9.17.2024.06.26.08.18.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jun 2024 08:18:38 -0700 (PDT)
Date: Wed, 26 Jun 2024 17:18:38 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Alexei Filippov <alexei.filippov@syntacore.com>
Cc: alistair.francis@wdc.com, alistair23@gmail.com, 
 apatel@ventanamicro.com, bin.meng@windriver.com, dbarboza@ventanamicro.com, 
 liwei1518@gmail.com, palmer@dabbelt.com, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, zhiwei_liu@linux.alibaba.com
Subject: Re: [PATCH v8] target/riscv/kvm/kvm-cpu.c: kvm_riscv_handle_sbi()
 fail with vendor-specific SBI
Message-ID: <20240626-1420003b7d88d892be22a719@orel>
References: <20240527-3510206a25da720148c06a43@orel>
 <20240625150254.38790-1-alexei.filippov@syntacore.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240625150254.38790-1-alexei.filippov@syntacore.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=ajones@ventanamicro.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SORTED_RECIPS=2.499, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Tue, Jun 25, 2024 at 06:02:54PM GMT, Alexei Filippov wrote:
> kvm_riscv_handle_sbi() may return not supported return code to not
> trigger qemu abort with vendor-specific sbi.
> 
> Add new error path to provide proper error in case of
> qemu_chr_fe_read_all() may not return sizeof(ch), because exactly zero
> just means we failed to read input, which can happen, so
> telling the SBI caller we failed to read, but telling the caller of this
> function that we successfully emulated the SBI call, is correct. However,
> anything else, other than sizeof(ch), means something unexpected happened,
> so we should return an error.
> 
> Added SBI related return code's defines.
> 
> Signed-off-by: Alexei Filippov <alexei.filippov@syntacore.com>
> Fixes: 4eb47125 ("target/riscv: Handle KVM_EXIT_RISCV_SBI exit")
> ---
> Changes since v7:
> 		- Fix error handling according to Andrew Jones suggestion.
>  target/riscv/kvm/kvm-cpu.c         |  9 +++++----
>  target/riscv/sbi_ecall_interface.h | 12 ++++++++++++
>  2 files changed, 17 insertions(+), 4 deletions(-)
> 
> diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
> index 235e2cdaca..1afbabe19f 100644
> --- a/target/riscv/kvm/kvm-cpu.c
> +++ b/target/riscv/kvm/kvm-cpu.c
> @@ -1515,19 +1515,20 @@ static int kvm_riscv_handle_sbi(CPUState *cs, struct kvm_run *run)
>          ret = qemu_chr_fe_read_all(serial_hd(0)->be, &ch, sizeof(ch));
>          if (ret == sizeof(ch)) {
>              run->riscv_sbi.ret[0] = ch;
> +        } else if (ret == 0) {
> +            run->riscv_sbi.ret[0] = SBI_ERR_FAILURE;
>          } else {
> -            run->riscv_sbi.ret[0] = -1;
> +            ret = -1;
>          }
> -        ret = 0;

It should be

diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
index 235e2cdaca1a..9946afb4eade 100644
--- a/target/riscv/kvm/kvm-cpu.c
+++ b/target/riscv/kvm/kvm-cpu.c
@@ -1515,10 +1515,12 @@ static int kvm_riscv_handle_sbi(CPUState *cs, struct kvm_run *run)
         ret = qemu_chr_fe_read_all(serial_hd(0)->be, &ch, sizeof(ch));
         if (ret == sizeof(ch)) {
             run->riscv_sbi.ret[0] = ch;
-        } else {
+            ret = 0;
+        } else if (ret == 0) {
             run->riscv_sbi.ret[0] = -1;
+        } else {
+            ret = -1;
         }
-        ret = 0;
         break;
     case SBI_EXT_DBCN:
         kvm_riscv_handle_sbi_dbcn(cs, run);

I misled you on that first 'ret = 0' addition, we need that, but I've
pointed out a few times that we should use '-1' instead of SBI_ERR_FAILURE
and why.

Thanks,
drew

>          break;
>      case SBI_EXT_DBCN:
>          kvm_riscv_handle_sbi_dbcn(cs, run);
>          break;
>      default:
>          qemu_log_mask(LOG_UNIMP,
> -                      "%s: un-handled SBI EXIT, specific reasons is %lu\n",
> +                      "%s: Unhandled SBI exit with extension-id %lu\n",
>                        __func__, run->riscv_sbi.extension_id);
> -        ret = -1;
> +        run->riscv_sbi.ret[0] = SBI_ERR_NOT_SUPPORTED;
>          break;
>      }
>      return ret;
> diff --git a/target/riscv/sbi_ecall_interface.h b/target/riscv/sbi_ecall_interface.h
> index 7dfe5f72c6..4df0accd78 100644
> --- a/target/riscv/sbi_ecall_interface.h
> +++ b/target/riscv/sbi_ecall_interface.h
> @@ -86,4 +86,16 @@
>  #define SBI_EXT_VENDOR_END              0x09FFFFFF
>  /* clang-format on */
>  
> +/* SBI return error codes */
> +#define SBI_SUCCESS                  0
> +#define SBI_ERR_FAILURE             -1
> +#define SBI_ERR_NOT_SUPPORTED       -2
> +#define SBI_ERR_INVALID_PARAM       -3
> +#define SBI_ERR_DENIED              -4
> +#define SBI_ERR_INVALID_ADDRESS     -5
> +#define SBI_ERR_ALREADY_AVAILABLE   -6
> +#define SBI_ERR_ALREADY_STARTED     -7
> +#define SBI_ERR_ALREADY_STOPPED     -8
> +#define SBI_ERR_NO_SHMEM            -9
> +
>  #endif
> -- 
> 2.34.1
> 

