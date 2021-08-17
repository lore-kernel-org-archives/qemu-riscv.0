Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mG7ND-0005q7-IU
	for mharc-qemu-riscv@gnu.org; Tue, 17 Aug 2021 18:15:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mG7NC-0005pg-3i; Tue, 17 Aug 2021 18:15:54 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:34622)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mG7N7-00069l-Ao; Tue, 17 Aug 2021 18:15:53 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 o1-20020a05600c5101b02902e676fe1f04so2425412wms.1; 
 Tue, 17 Aug 2021 15:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5W3A+sfqT6nYH4g1LcisACz356ot4STkWerS8EGf2KU=;
 b=Md+131zpHBGrCyPjNQZUJgdyTpR+V3DyYYMnyAbD3jLbt6d+XBkyTzw7j86uKtfNpC
 79yz7bxYusx3XXl5bA9DeN5Z/HDfPeGap0Vq3Uk3iYLhqTk8gTgzlorraGbXNiaqT+96
 /67C48UW8DjTxnFe74Yrq+8MYYEyBtVuSLVyQ+/lemQb53fFboS0FjSbzJvGyv3BD2rR
 Us18nQb+FYjyraYUFgr1F+51jFD5SBsM/Pp9RhvYFgzQE3Yr8MEa9THbZGGuV17OhkZs
 9swh6PvLKCwxz1b59oYhCWUP4+jgHuzK93zFA4RUDF6m0+2pK+dB2UmZEpKlXrBzJEjk
 yrKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5W3A+sfqT6nYH4g1LcisACz356ot4STkWerS8EGf2KU=;
 b=ltf+hQcmSXni9U4I4i/vp0Fn9EIUopuTmNcXMJIsZ3HuuoDJMuLzoweQkZ6ifaDmoj
 DmJSDd5kExRJ3Hv/v57LU4dn+rBVT9abWOCwl300VxdpnFkSCewHI2EZKVEpB0bwQq2N
 B/IsyQO1VAPsXCkQ8H5FpEPBzg0q+un9yDCq/3Id6l5HUFqq6yX/Hev2jL/GCEKG+4Yt
 gx5OGi2ZFtHcXTWbaE6OIooc5o5G+uyHNoPcgDyZ9Dl3BsOhF85Rg25JvUJ4dBf+vCzv
 CkzWISLAlgMo3rHbXGgnVlJmAD2H6EBn/5AaXS9RFEoQca+WaxcUwnxEMsU4Jj0VfbnY
 YeEw==
X-Gm-Message-State: AOAM5328TRUa54TiORn532BwWaXTeymjFhhnVdclN/OVLwx1+JHbLMA1
 lxWMuT6iV6FhavjoWwcVvUM=
X-Google-Smtp-Source: ABdhPJx2PLoI61HpY3R4T/JVHdCkyZ70crYp20oHi8iiPBUG5kvfXcdDdmP2tP+iUF+HYC+nuX22TA==
X-Received: by 2002:a05:600c:2213:: with SMTP id
 z19mr5249075wml.6.1629238546522; 
 Tue, 17 Aug 2021 15:15:46 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id s17sm3384443wmj.12.2021.08.17.15.15.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Aug 2021 15:15:45 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH v2 03/21] target/riscv: Add DisasContext to gen_get_gpr,
 gen_set_gpr
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: Alistair.Francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org,
 zhiwei_liu@c-sky.com
References: <20210817211803.283639-1-richard.henderson@linaro.org>
 <20210817211803.283639-4-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <9eea59d4-f59a-d31b-b5ca-562f4874ba07@amsat.org>
Date: Wed, 18 Aug 2021 00:15:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210817211803.283639-4-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-1.961,
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
X-List-Received-Date: Tue, 17 Aug 2021 22:15:54 -0000

On 8/17/21 11:17 PM, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/riscv/translate.c                | 58 ++++++++++++-------------
>  target/riscv/insn_trans/trans_rva.c.inc | 18 ++++----
>  target/riscv/insn_trans/trans_rvb.c.inc |  4 +-
>  target/riscv/insn_trans/trans_rvd.c.inc | 32 +++++++-------
>  target/riscv/insn_trans/trans_rvf.c.inc | 32 +++++++-------
>  target/riscv/insn_trans/trans_rvh.c.inc | 52 +++++++++++-----------
>  target/riscv/insn_trans/trans_rvi.c.inc | 44 +++++++++----------
>  target/riscv/insn_trans/trans_rvm.c.inc | 12 ++---
>  target/riscv/insn_trans/trans_rvv.c.inc | 36 +++++++--------
>  9 files changed, 144 insertions(+), 144 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

