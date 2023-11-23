Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AE53C5AD4C
	for <qemu-riscv@archiver.kernel.org>; Thu, 23 Nov 2023 20:38:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r6GSU-0005fL-7G; Thu, 23 Nov 2023 15:37:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1r6GST-0005f0-8X
 for qemu-riscv@nongnu.org; Thu, 23 Nov 2023 15:37:57 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1r6GSR-00017Q-L6
 for qemu-riscv@nongnu.org; Thu, 23 Nov 2023 15:37:56 -0500
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-1cf98db3569so4286285ad.1
 for <qemu-riscv@nongnu.org>; Thu, 23 Nov 2023 12:37:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1700771874; x=1701376674; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kZ3opmbdsKZYcUTskiib2tuLJ71Hd/pA8b2WyG9Oz6Y=;
 b=V+GEUA7Y0d73J5tw2QA+Y87jwfAuJ6MxfK8+/QdH36L4G0wLxsRZK2093wmXKir7uR
 h9FFCjj1BDk4sAu5hR0fkoNBCkS9ZD3w2hK/oIC/m1Pi8lHRejTHyB5pjkje9MADFM0k
 JTwN0dx7WFv2hVUI8LXTEJ/MRmjojSSNwOTnTQQIS/5ahemr7V6oURWAbNaArwGnXI27
 xUZWcfwD1WAisvSU8w//7OL59Zu+yOGZT2KQd2ZkH0x5kSLYvBi6Ep7p5pSjahMSSFW+
 Ka/iZhNcw4gQGLi9DemuZ4DL3S55NkaTdK/4Oq0kPTDorFHY1ia5Lydd3xiXw0I+GePs
 XVVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700771874; x=1701376674;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kZ3opmbdsKZYcUTskiib2tuLJ71Hd/pA8b2WyG9Oz6Y=;
 b=TJAPvSpEGTBtCnI1U3ZGrOXuFEbWFUu4+5f0yIhzQie7OSY5RMK2dkCIrSYRfcsave
 6nHXVxhjw13roeLw7Iim2t9dRTVS3b3ZXVFMOeZ42pB/rQNvQCY1zBI07/4OL4VrHr3j
 kJ+qXC2m1NvZXRyk7jrDBvJrUDoSfGiRQg2sAbcfQxxImPvLrIaoIPrJsGMj76U1u3mt
 66GIE0SV4r9ClSBc1KS090FrkrxB6d4sS1Bg0w3RngD1vS2Jw58FXkrMZhI3vM2QNTQ/
 uMspHDpn0ogWo18zO8AEdbl4GbsgdywyNPN8rHUgymISihAPbuz06JGRoTvxcZjIoAlG
 DpAw==
X-Gm-Message-State: AOJu0YzZUOZjgfqIv7ZkFZiJ16U1+Tx1v/OFF2VU+Epb3v6R8cQqrvBN
 NVh+bsqOOEe2yYovut9tTNcGpQ==
X-Google-Smtp-Source: AGHT+IHsarAfOsfP6jvw2oaSUicaVE0r9awbIb0oc2Rxk347CTsVWyZ7i2Qa84G4tZnzRIu8JTHWSw==
X-Received: by 2002:a17:902:f7c6:b0:1cf:5c9b:5c27 with SMTP id
 h6-20020a170902f7c600b001cf5c9b5c27mr419944plw.63.1700771873631; 
 Thu, 23 Nov 2023 12:37:53 -0800 (PST)
Received: from [192.168.68.109] ([152.250.131.119])
 by smtp.gmail.com with ESMTPSA id
 e5-20020a170902b78500b001cf59cccb10sm1668732pls.23.2023.11.23.12.37.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Nov 2023 12:37:53 -0800 (PST)
Message-ID: <d25f1acc-5796-4674-a9b7-cd2f25aae64f@ventanamicro.com>
Date: Thu, 23 Nov 2023 17:37:49 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] linux-user/riscv: Add Zicboz extensions to hwprobe
Content-Language: en-US
To: Christoph Muellner <christoph.muellner@vrull.eu>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Philipp Tomsich
 <philipp.tomsich@vrull.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <richard.henderson@linaro.org>
Cc: Laurent Vivier <laurent@vivier.eu>
References: <20231123181300.2140622-1-christoph.muellner@vrull.eu>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20231123181300.2140622-1-christoph.muellner@vrull.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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



On 11/23/23 15:12, Christoph Muellner wrote:
> From: Christoph Müllner <christoph.muellner@vrull.eu>
> 
> Upstream Linux recently added RISC-V Zicboz support to the hwprobe API.
> This patch introduces this for QEMU's user space emulator.
> 
> Signed-off-by: Christoph Müllner <christoph.muellner@vrull.eu>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   linux-user/syscall.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 65ac3ac796..2f9a1c5279 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -8799,6 +8799,7 @@ static int do_getdents64(abi_long dirfd, abi_long arg2, abi_long count)
>   #define     RISCV_HWPROBE_EXT_ZBA      (1 << 3)
>   #define     RISCV_HWPROBE_EXT_ZBB      (1 << 4)
>   #define     RISCV_HWPROBE_EXT_ZBS      (1 << 5)
> +#define     RISCV_HWPROBE_EXT_ZICBOZ   (1 << 6)
>   
>   #define RISCV_HWPROBE_KEY_CPUPERF_0     5
>   #define     RISCV_HWPROBE_MISALIGNED_UNKNOWN     (0 << 0)
> @@ -8855,6 +8856,8 @@ static void risc_hwprobe_fill_pairs(CPURISCVState *env,
>                        RISCV_HWPROBE_EXT_ZBB : 0;
>               value |= cfg->ext_zbs ?
>                        RISCV_HWPROBE_EXT_ZBS : 0;
> +            value |= cfg->ext_zicboz ?
> +                     RISCV_HWPROBE_EXT_ZICBOZ : 0;
>               __put_user(value, &pair->value);
>               break;
>           case RISCV_HWPROBE_KEY_CPUPERF_0:

