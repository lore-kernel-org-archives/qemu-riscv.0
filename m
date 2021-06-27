Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lxWnX-0000XF-Ri
	for mharc-qemu-riscv@gnu.org; Sun, 27 Jun 2021 11:34:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lxWnW-0000Ww-MF; Sun, 27 Jun 2021 11:34:14 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:43935)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lxWnU-0000hE-S3; Sun, 27 Jun 2021 11:34:14 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 p8-20020a7bcc880000b02901dbb595a9f1so9253290wma.2; 
 Sun, 27 Jun 2021 08:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=NgEU2g+M0vlQay6xf6kEyCjrBVGDKyRPcMOq3xPaZiU=;
 b=haQCrJhx1/Apk5xfjoWqZ79rJ5kR/p5j5i+Fw0sU5O/f98ao6U7KQ/gs7Fe8i/nIvI
 wNxM/nuLvyQTCgDxW2g4EjAd1hrSCnq4RP0mltVV52RBxFBBFqrZKmjxOJwxGVMaXS+o
 +lh/5L6bZ+1rXYLt77W9g8xQrgJzuK/4sVoj8XfM/GdJIn6qwP9acBXcbaTdNsWQcREF
 7zqRRgXBzrxmvMbgBkxkCaMSNQ9NmvhIi4u/qdA/jWJ/xStMJ6lUlOlEx+iLpmKitFB9
 dCqpbkjdkaTDOq+tCsqSGfweykwYP34sdhYztJDXclPIJ1HWtkjWFt3vFZxvM+0FxQC6
 QDTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NgEU2g+M0vlQay6xf6kEyCjrBVGDKyRPcMOq3xPaZiU=;
 b=aTRYxuLwAwqcz9WEQ2TU73OJjBJr5w4MIRMfjN0cyMBKvIJB3U/g0ioewmoM4i9FTC
 JcAnvl9byU+pt3Jn3M1QMnp9Znl5LpzhLaMxtuZFLwxMGGX7oc68gNnNjWU2o467jth2
 Tb763cy+EVY2n5hhxZyxTDRFFdmVanZH+19/Ij95+/0+/E9zAA9xhIzdvoyKbNVzp86X
 /eJghODDexPfvLpoM8re+i78pmNaQrnK09vPhxN5OpU6kNbZgpQ+SASQgy0AX8eNpXfw
 f7jlZGsaSkh6Xojo24qYGoejAvIFgRURrDNxk1WfBTzVfpb2Brgl4c7QYCe+UkWZTT5q
 n5Kw==
X-Gm-Message-State: AOAM530ylk/tbMWE6czCwU8Ydl8Y/cwUFi1pUYRk5YDgHcUL8drmUbAG
 Pet6lHisj8sgvlBsLsGrGRWMIEWQV2tSMA==
X-Google-Smtp-Source: ABdhPJyTZcx9ulUB6mNf70xS48TdpwBcKmeKZ8mIGy1B0s7rebvDet/ew/4WIlpDb1l4f0VGoMZLCA==
X-Received: by 2002:a05:600c:3791:: with SMTP id
 o17mr22157745wmr.187.1624808050730; 
 Sun, 27 Jun 2021 08:34:10 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id f19sm11698498wre.48.2021.06.27.08.34.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Jun 2021 08:34:09 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH] target/riscv: pmp: Fix some typos
To: Bin Meng <bmeng.cn@gmail.com>, Alistair Francis
 <alistair.francis@wdc.com>, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20210627115716.3552-1-bmeng.cn@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <a088e346-59b0-3e44-d482-0bf74fa91d16@amsat.org>
Date: Sun, 27 Jun 2021 17:34:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210627115716.3552-1-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-1.765,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Sun, 27 Jun 2021 15:34:14 -0000

On 6/27/21 1:57 PM, Bin Meng wrote:
> %s/CSP/CSR
> %s/thie/the
> 
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
> ---
> 
>  target/riscv/pmp.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

