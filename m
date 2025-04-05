Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AA0CC369A3
	for <qemu-riscv@archiver.kernel.org>; Sat,  5 Apr 2025 09:19:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1u0zff-0002Kj-S4; Sat, 05 Apr 2025 05:18:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1u0zfY-0002Dh-Ew
 for qemu-riscv@nongnu.org; Sat, 05 Apr 2025 05:18:31 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1u0zfV-0008M8-Pt
 for qemu-riscv@nongnu.org; Sat, 05 Apr 2025 05:18:27 -0400
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-223fb0f619dso28555015ad.1
 for <qemu-riscv@nongnu.org>; Sat, 05 Apr 2025 02:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1743844702; x=1744449502; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CwDVB2zqCipfAqxeZiYPIYy9g2myx+HcuNJ5Z7jMIS8=;
 b=Z53oxZUwSEqIY+F4GbRdyvwYXVaRTbPgAbKvtvtMDZS7sblmGCvXo+ZK7v6xsqvDiQ
 jU7qmLusWfclHW4TbATLc6THDu4LnGX2GK8mBQhwJVoEiso50bfRP8oBayaLvrkjfZ9F
 Eh83I+g2goEzYwd2XmHy9weBIVXcI/BWlBwvUu23PavJ/qFHOcd4zAxTtdo5kFNYbqrK
 Xl8BzTgM+MxK5b3tBZGW5sFDpqeuRGPzujH+kalAWQcHpN+Muk2tQXhCAah2Ri4WRJKm
 UhPVaToZ8C/gCl7Q93oYKN4IcdoxoRy3xYD9M+G1mUnVQ2I4sjUtB8/bvVfLkQrGcmTN
 P0eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743844702; x=1744449502;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CwDVB2zqCipfAqxeZiYPIYy9g2myx+HcuNJ5Z7jMIS8=;
 b=Fs96doQzN64yjhfhxMy70SHqCNynkNXnkDAFeC78P31jvGkpXhiTG0uHagWh4RIe59
 cWtoKPJVhtwePNVQiHr3Ynx7Exn0U5Bh5+tQAncpSp8ha4PN7YFNNG7pzQxuFLrQqFSP
 jQJSUML583YSi3YzMwW8eAnYNr3z1QRI8jIWNtsFUrk372kPbH64RmA4xwS9COflTuu7
 FVwrcBitiNcoBSqnjbcp9A4YW6aDmRNtY1eTzNVHTIr54cKZpttBBz8viQxSlnTt1W1E
 jxLJzYahF5tAEX4y8qZ3PnXr9vPRs4Ak7xeceRfsRSEw4Ikpb+6anCgRlXIzxlM9Uzrq
 j1cw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX5jLinr/Rt1a+fJyDOSblrOmohrvEhNkrHUHp/xBBO9HFX/0+3zClwIMilWTmTMGJe4ssGzhith53e@nongnu.org
X-Gm-Message-State: AOJu0YwgidhXIxDdbmZ/a1Gqlyazfx+dnlqV2tJBuZVaTQCYOBetxciw
 KJNnjqCiZKWvvn08bS793FLkcuZptqnB9m4E17QoPk0bgsINrWXNA6p8eoddtCT1KgkWQ5k0wqg
 w
X-Gm-Gg: ASbGnctMPHoL1H4DyiUYLK3Z85CUeWkPAubgXX2YYpyzXlvsPj4oR/5MH37JIFUsr1/
 6+W/rVPOgrLwBO15O6jWrkbuPIC7e7XUkHnw4PF1GBSVdnr0gjxnE/E4Cdwr/GkY9J03lIim4vU
 ABewKfPzKdlJtzSr1OMVPDoptVUfC3F+KX3mMvxMJUZ9maWZ2Lh3uxnLS/GA2fkIcVZHDrGRGYI
 vwWs4NXpen8rIsKLMR11+CBri5sEgo7P1CnJPgJ5KHyOcnrlfiWLd6C/EUT2u9DhK2o4iAdk+ci
 bDsJvi/e71WUdDb03JtEoKXpZ/2C6+AvS4abQT4i3tU40yClzxn0W2Gz7NNd
X-Google-Smtp-Source: AGHT+IH2YvloWLMM6NZ2ws7N++/Y89ElHtyynUgzwUTCdsFTTFHmLuxyUIMLlvg5LN5BSti/36bJxw==
X-Received: by 2002:a17:903:1209:b0:224:76f:9e4a with SMTP id
 d9443c01a7336-22a8a05b5cdmr85417545ad.14.1743844702561; 
 Sat, 05 Apr 2025 02:18:22 -0700 (PDT)
Received: from [192.168.68.110] ([177.170.227.223])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2297866dcd6sm45788425ad.189.2025.04.05.02.18.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Apr 2025 02:18:21 -0700 (PDT)
Message-ID: <8ede9d37-1194-48ad-b053-9145dd414895@ventanamicro.com>
Date: Sat, 5 Apr 2025 06:18:18 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/12] target/riscv: rvv: Apply vext_check_input_eew to
 vector slide instructions(OPIVI/OPIVX)
To: Max Chou <max.chou@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 antonb@tenstorrent.com
References: <20250329144446.2619306-1-max.chou@sifive.com>
 <20250329144446.2619306-8-max.chou@sifive.com>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20250329144446.2619306-8-max.chou@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org



On 3/29/25 11:44 AM, Max Chou wrote:
> Handle the overlap of source registers with different EEWs.
> 
> Co-authored-by: Anton Blanchard <antonb@tenstorrent.com>
> Co-authored-by: Max Chou <max.chou@sifive.com>
> Signed-off-by: Max Chou <max.chou@sifive.com>
> ---


With your co-authored-by tag removed:

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   target/riscv/insn_trans/trans_rvv.c.inc | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
> index 2282b89801c..f397ae46446 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -639,7 +639,9 @@ static bool vext_check_slide(DisasContext *s, int vd, int vs2,
>   {
>       bool ret = require_align(vs2, s->lmul) &&
>                  require_align(vd, s->lmul) &&
> -               require_vm(vm, vd);
> +               require_vm(vm, vd) &&
> +               vext_check_input_eew(s, -1, 0, vs2, s->sew, vm);
> +
>       if (is_over) {
>           ret &= (vd != vs2);
>       }


