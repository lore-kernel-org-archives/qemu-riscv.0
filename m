Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1E9CCA6017
	for <qemu-riscv@archiver.kernel.org>; Sat, 10 Oct 2026 07:46:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xFRmB-0001Eq-5A; Sat, 10 Oct 2026 03:45:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1xFRm7-0001E9-Gi
 for qemu-riscv@nongnu.org; Sat, 10 Oct 2026 03:45:48 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1xFRm5-0004rq-RY
 for qemu-riscv@nongnu.org; Sat, 10 Oct 2026 03:45:47 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4a0286c981dso4165435e9.2
 for <qemu-riscv@nongnu.org>; Sat, 10 Oct 2026 00:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1791618344; x=1792223144; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=6rEbUZT8JrIgjKe9a62xSWCSsdjW4XckhpXsYtq7+MU=;
 b=h1gM6/ESiDKbG3Z5HZtz3Ig2gmpRW284aDnLGTRWozvU3Gf88GVcnBICcWAlthRAAk
 lLJazlCwJVwzJtDcKW3Uy2abYlmUJINsS5bHzFiYAXUvEiLn216OHT0qA/zRCqEBl5Zp
 j8Sv0c+UXS0hfiYOw4XndxxiGOfj966cizJrepiZgDMAAK6MnWFgQCNihB5fD/HMAZJW
 JUNrljmAPzQA/eIJGXPaaRkqqBYcRGygEhKFXyRudLQLYy2PTqZ5zjg0//2P4mTmMxdt
 J077tUSp9q/cdPJnGEOlr0ClJO/2wYoJ5FE1fL0UVij+rgwssBh6SwW7by951A0MuqV4
 Lr3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791618344; x=1792223144;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=6rEbUZT8JrIgjKe9a62xSWCSsdjW4XckhpXsYtq7+MU=;
 b=Ht04I5q3hBgo+yg9YJ/WpPnPD6NOkpUymcbQ3RNTt3ODajOoqGSay0geelAE0peukL
 Av1WOTcNJHJJHTGkVWkrvmolfulnWInS6th+vDaYeW8c/E6DClz9tz63Lwlws9L8qTfl
 taYvpHLnKz9CLI1w4teozT6esrUtTXn76VuUGNd9jM4YPr67KmleSHuGycj8Ey74JA9d
 Ppylr1ldv7vRqhFyjql1n8VBE7QobZr3hBqp/BjmTYwxh+RwcF3Xj239x6p8LNA1w9tr
 vfLjfHZZLLaIUc7pBiH8IYRV06JUskdwpS+64MzVeUZtLKZMSIllOvDl8FBBag07Mmhr
 eAHw==
X-Forwarded-Encrypted: i=1;
 AKwUvBySooPtYGqQIXlYOM2775UARrGITSFJLKMbrjeAHc3HrL+QGg/TTVb5//n88CtoUIOrgzwekXplVeHT@nongnu.org
X-Gm-Message-State: AFq9FYKUVE0IeSHpxpKbwGKKdvQFlbraFj9dbtOA/QaMSvdXqrXqz6ps
 0r8B6m/JL/kBbuTDkwd885Py7VrUyHJHY+buPMWuGPLDdtVcW/TIfWo4xbWufbYJzP4=
X-Gm-Gg: AYBFou0J8yHQ2nC3eSNLzAmTzAzO8P+Tu339FX0ipHqMRe3zYKuLTSeqLSVg4kNpPkX
 0wx2hdCxL1st0oTduG9kxpdTr/QHWiY6woD6iJPhzgq+DBGI2UmVHAPZbAxDAc1cl1yQ89adSE6
 4y2J6EehM26B6C2bIPki/ef65fITI4NQ21jzsYeycKxOs0ZJ4VqNIj9bk4AT8JfHoKG4itDu/dC
 h02bwJsNFRp2TyUMnAwclerBfiDuukn7Ov6ME4LYQ2JrGrHEIza16bhh6cr1pClkvbBBa2YqSup
 1xoVkYUV/qWc7eMeSB3TPwsp1KzCQtXj3/Sz7/tUKrT/9M/dlPQvcbEfIYjLcFCzgow6NC/g2L+
 hBwffXtRML2+3Z6y/t0yZAgSLOAcEKt4G0ltEfd7MRcFGPw55rJ6TajNNqwDoUTKUZLN2AmImwP
 NKrIjlyFyYsG1kg5j4iFjGsZGPAnmkgLrFenTE4kuYSUE4mUBOlQENKW45Q2dUZLH1Jtzgp4Pou
 8TawGkbMy/NK9moio8SiryqQ77SIT2W++SqOikAwHg40JnKYRC4SX4=
X-Received: by 2002:a05:600c:4ecb:b0:4a1:6916:798 with SMTP id
 5b1f17b1804b1-4a18e4a3f69mr77392505e9.14.1791618343890; 
 Sat, 10 Oct 2026 00:45:43 -0700 (PDT)
Received: from ?IPV6:2a00:1e:e082:2901:a2d3:66fa:95e6:7d81?
 ([2a00:1e:e082:2901:a2d3:66fa:95e6:7d81])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48db9462ebcsm8451254f8f.8.2026.10.10.00.45.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 10 Oct 2026 00:45:42 -0700 (PDT)
Message-ID: <f8ea6e43-2e6e-48b7-a61c-d9ec2200872c@linaro.org>
Date: Sat, 10 Oct 2026 09:45:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] tcg: namespace target helper symbols for combined
 builds
To: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Yonggang Luo <luoyonggang@gmail.com>, qemu-devel@nongnu.org
Cc: Song Gao <17746591750@163.com>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Alistair Francis <alistair.francis@wdc.com>,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Weiwei Li <liwei1518@gmail.com>,
 Sunil V L <sunilvl@ventanamicro.com>,
 Philippe Mathieu-Daude <philmd@mailo.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-riscv@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Chao Liu <chao.liu@processmission.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <anisinha@redhat.com>, qemu-arm@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
References: <20260930073935.712-1-luoyonggang@gmail.com>
 <20260930073935.712-5-luoyonggang@gmail.com>
 <374ba010-b530-4310-b20f-65ada56cda6b@oss.qualcomm.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <374ba010-b530-4310-b20f-65ada56cda6b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x330.google.com
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

On 10/1/26 18:51, Pierrick Bouvier wrote:
> On 9/30/2026 12:39 AM, Yonggang Luo wrote:
>> Use target-specific assembler names and helper metadata for TCG helpers
>> when multiple targets share a binary. The generated prototype maps the
>> generic C helper name to a target-specific linker symbol, for example:
>>
>>      helper_raise_exception
>>          __asm__("helper_i386_raise_exception")
>>
>> This lets target helper definitions keep generic C names while avoiding
>> linker symbol collisions between targets.
>>
> Hi Richard, do you have an opinion on this patch?
> 
> We are trying to see if we do renaming per helper, or if we introduce a
> "generic" way to deal with it. I don't have a strong opinion, renaming
> things or adding more macros and build system soup are both ok on my
> side, so direction would depend on your culinary taste.
I think the general direction is good.  Perhaps the specifics need 
adjustment.  In particular, using __asm__ to rename symbols is suspect 
and likely non-portable to non-ELF hosts like Darwin and Windows.


r~

