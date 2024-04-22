Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1BEEC4345F
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 Apr 2024 12:31:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1ryspn-0003LV-N4; Mon, 22 Apr 2024 08:31:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1ryspl-0003L0-DZ
 for qemu-riscv@nongnu.org; Mon, 22 Apr 2024 08:31:45 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1ryspi-0002JC-LW
 for qemu-riscv@nongnu.org; Mon, 22 Apr 2024 08:31:44 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-41a523e27e0so6627215e9.1
 for <qemu-riscv@nongnu.org>; Mon, 22 Apr 2024 05:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1713789100; x=1714393900; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ZI1T8PHo8jjdNMlhe6mps6tgMhEtU9omwpSm04ySF3M=;
 b=K78C6xpZoEkfB/xQI5Cfr7OtIAwbLnkNnyWX1wSirXE1mflzFOzqopRpSQQQIYnjHw
 BA3AjbCuYBrcVVr8tNeO4F1s9y7VTZZx1lWxishZLWIxssJPpvIlmANgQKRG1b6MIPTM
 +95AuXExIUhAsGUxvfSGy9WUET3IYl0sYxeppbPPgybfTqsbrSMrAO8cau3Fl89pG6PG
 3gSf96bzUWDimAj6IumV0xIlC20fjsDn9s/sjxpBBCjOaDFrPgNinLAZ4S6ASZ0eSsA2
 INrvEqaTV11+Vz7DzD/ZgOYB0myQGwt9p7BFJzXM8Hmg74W/xr9KqtbWElrdN6VwpwkR
 gUbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713789100; x=1714393900;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZI1T8PHo8jjdNMlhe6mps6tgMhEtU9omwpSm04ySF3M=;
 b=ZNEJxxwYcMm/68u9av0/UKTMUlLRn+Fl1nx/GngmpIbI7c83/DUzfGwJvD18G5H5cR
 15l1IA1EJ82LaqPZ1sAZAqk8mKxWjM0FGGeFmQJRhktzPQsTdmpq9BxKItbvo2HAZyLK
 vbBqh/q5sJfKL4ZEondJ8NrukCGWP446XWF4gQqGFieG2IsgCHwyDkn6lbJCHGE81Roz
 wIiP4lVgqTkWuiQ53CClFF/iaqPp+BwxGQgH5thPcVGwfG6KewoCJyIMPQwCCHE/b6wl
 135LjgQz/xjy6nVE59G8dz837mH1MYJ9RyCPUMndNvV+nKjbUCj6dP4ltMteZosVrPzJ
 x0Sw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWOC1ej0LuP7B1uykR6eep2yuKz4o+fY5gp6IXNv4RITcF+vV9sl/2Zm03YgFJNrdIOdngvB1GWJoDZUhQoMSZxSFbFW0A=
X-Gm-Message-State: AOJu0YxqNrL9F9XOqBoa8rlivg9ulzuImdn57ZRMadoJ1IM4vmUIJFSC
 O9oAer5m/glDIWa1Bi7kZ5dLVqWofzz8RgKaWO59NoFA9UP0Cl67RbR+TGzqZXo=
X-Google-Smtp-Source: AGHT+IHi6jdv7fD2kw+ctLpZD309ru90K+KUZbLaVBMRB+cAk7umUEWPwVNNapF69aeJ1TWfMWTueA==
X-Received: by 2002:a05:600c:5252:b0:41a:908c:b841 with SMTP id
 fc18-20020a05600c525200b0041a908cb841mr569057wmb.32.1713789098058; 
 Mon, 22 Apr 2024 05:31:38 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 q6-20020a05600c46c600b0041892857924sm16637189wmo.36.2024.04.22.05.31.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Apr 2024 05:31:37 -0700 (PDT)
Date: Mon, 22 Apr 2024 14:31:36 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Alexei Filippov <alexei.filippov@syntacore.com>
Cc: alistair.francis@wdc.com, alistair23@gmail.com, 
 apatel@ventanamicro.com, bin.meng@windriver.com, dbarboza@ventanamicro.com, 
 liwei1518@gmail.com, palmer@dabbelt.com, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, zhiwei_liu@linux.alibaba.com
Subject: Re: [PATCH v6] target/riscv/kvm/kvm-cpu.c: kvm_riscv_handle_sbi()
 fail with vendor-specific SBI
Message-ID: <20240422-fd9fc07462257b6da42d8eb5@orel>
References: <20240422-e78b28f00a168518c5d4937a@orel>
 <20240422114254.13839-1-alexei.filippov@syntacore.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240422114254.13839-1-alexei.filippov@syntacore.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=ajones@ventanamicro.com; helo=mail-wm1-x32c.google.com
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

On Mon, Apr 22, 2024 at 02:42:54PM +0300, Alexei Filippov wrote:
> kvm_riscv_handle_sbi() may return not supported return code to not
> trigger qemu abort with vendor-specific sbi.
> 
> Add new error path to provide proper error in case of
> qemu_chr_fe_read_all() may not return sizeof(ch).

I think something more along the lines of what I wrote in my previous
reply will help clarify this more. Here's what I wrote

"""
Exactly zero just means we failed to read input, which can happen, so
telling the SBI caller we failed to read, but telling the caller of this
function that we successfully emulated the SBI call, is correct. However,
anything else, other than sizeof(ch), means something unexpected happened,
so we should indeed return an error from this function.
"""

Thanks,
drew

> 
> Added SBI related return code's defines.
> 
> Signed-off-by: Alexei Filippov <alexei.filippov@syntacore.com>
> ---
> Changes since v4-5:
> 		-Added new error path in case of qemu_chr_fe_read_all() may not
> 		return sizeof(ch).
> 		-Added more comments in commit message.
>  target/riscv/kvm/kvm-cpu.c         | 10 ++++++----
>  target/riscv/sbi_ecall_interface.h | 12 ++++++++++++
>  2 files changed, 18 insertions(+), 4 deletions(-)
> 
> diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
> index f9dbc18a76..5bb7b74d03 100644
> --- a/target/riscv/kvm/kvm-cpu.c
> +++ b/target/riscv/kvm/kvm-cpu.c
> @@ -1173,16 +1173,18 @@ static int kvm_riscv_handle_sbi(CPUState *cs, struct kvm_run *run)
>          ret = qemu_chr_fe_read_all(serial_hd(0)->be, &ch, sizeof(ch));
>          if (ret == sizeof(ch)) {
>              run->riscv_sbi.ret[0] = ch;
> +            ret = 0;
> +        } else if (ret == 0) {
> +            run->riscv_sbi.ret[0] = SBI_ERR_FAILURE;
>          } else {
> -            run->riscv_sbi.ret[0] = -1;
> +            ret = -1;
>          }
> -        ret = 0;
>          break;
>      default:
>          qemu_log_mask(LOG_UNIMP,
> -                      "%s: un-handled SBI EXIT, specific reasons is %lu\n",
> +                      "%s: Unhandled SBI exit with extension-id %lu\n"
>                        __func__, run->riscv_sbi.extension_id);
> -        ret = -1;
> +        run->riscv_sbi.ret[0] = SBI_ERR_NOT_SUPPORTED;
>          break;
>      }
>      return ret;
> diff --git a/target/riscv/sbi_ecall_interface.h b/target/riscv/sbi_ecall_interface.h
> index 43899d08f6..a2e21d9b8c 100644
> --- a/target/riscv/sbi_ecall_interface.h
> +++ b/target/riscv/sbi_ecall_interface.h
> @@ -69,4 +69,16 @@
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

