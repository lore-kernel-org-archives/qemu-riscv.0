Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62E5CC61D97
	for <qemu-riscv@archiver.kernel.org>; Fri, 24 Nov 2023 16:59:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r6ZWL-0001QB-46; Fri, 24 Nov 2023 11:59:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1r6ZWI-0001Nv-NU
 for qemu-riscv@nongnu.org; Fri, 24 Nov 2023 11:59:10 -0500
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1r6ZWG-00040t-Am
 for qemu-riscv@nongnu.org; Fri, 24 Nov 2023 11:59:10 -0500
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-54a945861c6so3052734a12.3
 for <qemu-riscv@nongnu.org>; Fri, 24 Nov 2023 08:59:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1700845146; x=1701449946; darn=nongnu.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=hOLgOQKzK1BDJMKfOSKg4vfmJjUUMztCvbGLYQB+szY=;
 b=jjP03OeQQTNb6NZjUgwLVxi6+qouHCxJjsTcURJeaAssN4pN9FjBJxcP5RiGoURc1M
 O9p2MApJfA/qA7YZU3hlk2qJzH03uyutyyWHSOMLoYJHcYeXOy0ki0diyWzgSXi6RDZJ
 TK3rFQIgrX0ld1D4A0mmAgv3mjefSgOVNOwyvlGuJ3lrgRHA11rkjOHs+o5W321LYdym
 kYADssAlmsWp440PVldzPLlx5EUES5sAZDKuP+9wCHDaF6CoMvKO9OqSkm8hMAHlK0GZ
 GauH6LWgFUI/VOGs3H2gFogL3Z+tjPBA0d4bbEsW9NKQDJlz1FrNFxJDO15HD6lPMLRy
 ohzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700845146; x=1701449946;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hOLgOQKzK1BDJMKfOSKg4vfmJjUUMztCvbGLYQB+szY=;
 b=Tp7AkTYO9utpNoi3Em0HSJGCuAUIxQluhhBnPXv5VgZferKLIJLCqbYfkJyhNWtUcl
 ubVnX8IrIzB3yg+CUzLlapT735yvlPDgpeFoF5Oi2zKDzvdEMSPOJ8zh+TJf3jydQnpQ
 n1UncjG/QASkho+wUIAK3UChk+Q4S1ln8lwXX5ZSlzkvibOyrNTuNPiB2pVTCWte+6vV
 qxUTO25IumvX97jsWywl/I73xFmdd7c0aEks/OiDHBP9ArNaFVuAfRHs+B+u1uWfkX4I
 EF5v17ssTGoo63f2xkOjf6Wb3A3mnAUfqHXssMKyzv5+KTtu6MTLC7GqWhOND8wIQYqI
 ewRA==
X-Gm-Message-State: AOJu0YwC72wfsTcxeh/Ac0GNuGUnCdtkOs07womjx4JxHqv520fhx2uo
 OeZlRYxkjv55zdqTgy4fgB+yYw==
X-Google-Smtp-Source: AGHT+IH74fG/WtvZeMbR5g9Pju4mTMO+xFST48qNIWpgYbmv19tPwohayRa36eZ3Y7BikLxW7XsJBg==
X-Received: by 2002:a50:d496:0:b0:548:7a6f:b51e with SMTP id
 s22-20020a50d496000000b005487a6fb51emr2751990edi.14.1700845146443; 
 Fri, 24 Nov 2023 08:59:06 -0800 (PST)
Received: from localhost ([81.19.4.232]) by smtp.gmail.com with ESMTPSA id
 q7-20020aa7da87000000b00548b55f5ffdsm1966756eds.16.2023.11.24.08.59.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Nov 2023 08:59:06 -0800 (PST)
Date: Fri, 24 Nov 2023 17:59:05 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Christoph Muellner <christoph.muellner@vrull.eu>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH v2] linux-user/riscv: Add Zicboz extensions to hwprobe
Message-ID: <20231124-b892dc7ca5a5f9ff4cceda6e@orel>
References: <20231123181300.2140622-1-christoph.muellner@vrull.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231123181300.2140622-1-christoph.muellner@vrull.eu>
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=ajones@ventanamicro.com; helo=mail-ed1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Thu, Nov 23, 2023 at 07:12:59PM +0100, Christoph Muellner wrote:
> From: Christoph Müllner <christoph.muellner@vrull.eu>
> 
> Upstream Linux recently added RISC-V Zicboz support to the hwprobe API.
> This patch introduces this for QEMU's user space emulator.
> 
> Signed-off-by: Christoph Müllner <christoph.muellner@vrull.eu>
> ---
>  linux-user/syscall.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 65ac3ac796..2f9a1c5279 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -8799,6 +8799,7 @@ static int do_getdents64(abi_long dirfd, abi_long arg2, abi_long count)
>  #define     RISCV_HWPROBE_EXT_ZBA      (1 << 3)
>  #define     RISCV_HWPROBE_EXT_ZBB      (1 << 4)
>  #define     RISCV_HWPROBE_EXT_ZBS      (1 << 5)
> +#define     RISCV_HWPROBE_EXT_ZICBOZ   (1 << 6)
>  
>  #define RISCV_HWPROBE_KEY_CPUPERF_0     5
>  #define     RISCV_HWPROBE_MISALIGNED_UNKNOWN     (0 << 0)
> @@ -8855,6 +8856,8 @@ static void risc_hwprobe_fill_pairs(CPURISCVState *env,
>                       RISCV_HWPROBE_EXT_ZBB : 0;
>              value |= cfg->ext_zbs ?
>                       RISCV_HWPROBE_EXT_ZBS : 0;
> +            value |= cfg->ext_zicboz ?
> +                     RISCV_HWPROBE_EXT_ZICBOZ : 0;
>              __put_user(value, &pair->value);
>              break;
>          case RISCV_HWPROBE_KEY_CPUPERF_0:
> -- 
> 2.41.0
> 
>

We should also add support for getting the block size with
RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE.

Thanks,
drew

