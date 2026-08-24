Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C1B2C5DF97
	for <qemu-riscv@archiver.kernel.org>; Mon, 24 Aug 2026 03:29:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wyLNL-0000Ay-M8; Sun, 23 Aug 2026 23:29:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <portias@tenstorrent.com>)
 id 1wyLNK-0000Ai-Th
 for qemu-riscv@nongnu.org; Sun, 23 Aug 2026 23:29:30 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <portias@tenstorrent.com>)
 id 1wyLNF-0001jU-Rm
 for qemu-riscv@nongnu.org; Sun, 23 Aug 2026 23:29:27 -0400
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-2cad68425a7so3166335ad.1
 for <qemu-riscv@nongnu.org>; Sun, 23 Aug 2026 20:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tenstorrent.com; s=google; t=1787542164; x=1788146964; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=gW4/EZVhjXWiC12MFKyJb7aywhdXSmswIbcklE+XDgI=;
 b=BlFizvkBqwiD5uyxx1MNU6SIjGjBcCf9vMHbHIpG1Ez4QlwJk2QCJscI6SM22If4Dw
 9ja+NaIWYdNRsD5pCFj35gFSLAZqFdDPO8zVM8Ya5PvxPGQpA39CBUKO2waxD/Xv/y4D
 Yr/eOAAHleqFqoX0Yc1Em4xHszZLMxJH/zsr6f/o2Ps62gwxMlAH7eZG8JFlKRFMBZrd
 RMHzXinuy/XJVOJjqcIvxnkKMaohQ+gH5KRvNQlFgYyy9LstCzaiZu/pHRFhtZqzY9lL
 d9y4qzHuelPnJYZ/oqKlp2o6JPHU+gF89tlBXl9Z7rDW7BHa3qvP1xRQGwpv1s4ph+v7
 v4VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787542164; x=1788146964;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=gW4/EZVhjXWiC12MFKyJb7aywhdXSmswIbcklE+XDgI=;
 b=GRiw3GZOPwJAGxiDlMvV6yQ6TShLIn4Ax+C4XnlwpOwfDHmc0sS6jmTY8bR1OJVHeE
 bM+BwrIbgLK+FbVd0ggbNq0pd0CCYXVzVAXmqMdUaw5ycKlAQOuVAkmmdRInzAs63fiL
 m2J+/uKAnz/BDJYvvKjwEkFvWKcdgrnvqbIk8nkhXSvlgwOj6ThwY+OgE26lFIfsBtLV
 hIFWaSxjjoIhhe9WL1n3oxJJXaPLiyMDz7nrwqAdGBoxhw09PF8mNqH8KhK3ug0g0bnA
 AYHcARJmY2VkHe5UsJWFeApiSPFSRRwkUdnxr2OEu30ZM4WEkY5IJPPuUURhE1UYNqO/
 a2Cw==
X-Forwarded-Encrypted: i=1;
 AHgh+RqMgYeGHNbEf/MDbgTe8ddZQUXsEp/9A5OlEdZwKOahiv0EV+cV3ojV6O1QjhK6vw5vdl0MyKf5vOKm@nongnu.org
X-Gm-Message-State: AFuF++kKRqONPCQMvMtKWRdWdw/2/MSI7G6DyyvPIw1DNBMWx3asfUu4
 O82BvgD45uUp0+XENED2DcztUUQdpfxRxcL2yXNvZfpNJwlOY/8LpiPxM3JEhpN8tI4=
X-Gm-Gg: AR+sD13j5vx/63LugFpf8vgMJij2lCMEAmQ15EvtOannMM6M455KNsg57nq7jqp6233
 pn6QwAdgmLR5+yeKcx5S0UTyY2CT1ExUSi9hcUyhcsx9tTPDk+bIqR2mwv0268zz0DJh3POqHtl
 nMvlOgNFwDEDPOKRZ2L88+4m67y1Mw2CmEGNAVPiVmc7gmN8r62lIBI6ZDzJdbpw0NYkWg62RJX
 L1D2J9C7cEXzgxkL1FnOqSgKuegvVkzbD3Gi134MwBi/3lP2yKsFs3H278Y8o8Y/8jGr0Sy8Zgt
 TFxI6JAc7z6+yu3Kn9V+8XDLbG99LxyeVKsVDnjxqVyIUwYe71T0RnIMlAYayz5yTLbum1+5zmO
 OoTE55cI9o6qdQzbnnqlouevqIRhrgj0raqkBIW1w3qVAC/+h9mRZPSHcAWUn/4NgVWtFTWvQGl
 4aTZvh4U3aV/tK/CXY8EGIOdCiH4VW5s4guW67zxZZub0Vg7MAhXKp1pyyFtLJOgjTN3BtvjlOX
 zWWmj9ANXcOWp/T
X-Received: by 2002:a17:902:f709:b0:2c9:d298:6c0a with SMTP id
 d9443c01a7336-2d64b047823mr216922115ad.2.1787542164383; 
 Sun, 23 Aug 2026 20:29:24 -0700 (PDT)
Received: from [172.16.1.33] ([159.196.41.205])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-327f91d37d9sm22480750eec.14.2026.08.23.20.29.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Aug 2026 20:29:23 -0700 (PDT)
Message-ID: <debde646-6ec3-47de-92ec-ff9d1ce56ed3@oss.tenstorrent.com>
Date: Mon, 24 Aug 2026 13:29:18 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] hw/riscv/aia: Check for invalid IMSIC configs
To: Joel Stanley <joel@jms.id.au>, Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Cc: Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei
 <zhiwei_liu@linux.alibaba.com>, Chao Liu <chao.liu@processmission.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
 Michael Ellerman <mpe@kernel.org>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
References: <20260824030509.18078-1-joel@jms.id.au>
 <20260824030509.18078-3-joel@jms.id.au>
Content-Language: en-US
From: Portia Stephens <portias@oss.tenstorrent.com>
In-Reply-To: <20260824030509.18078-3-joel@jms.id.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=portias@tenstorrent.com; helo=mail-pl1-x631.google.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


On 24/8/2026 1:05 PM, Joel Stanley wrote:
> Assert that the IMSIC layout will be valid before creating the devices.
>
> aia_guests is a command line parameter but the machines that allows it
> to be set (currently only virt) should be passing the correct stride for
> a given number of guests. The assert helps catch bugs in future changes
> and shouldn't be triggerable by an invalid user config.
>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>   hw/riscv/aia.c | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/hw/riscv/aia.c b/hw/riscv/aia.c
> index c33a3b32bd45..c1a5982856c5 100644
> --- a/hw/riscv/aia.c
> +++ b/hw/riscv/aia.c
> @@ -43,6 +43,10 @@ DeviceState *riscv_create_aia(bool msimode, int aia_guests,
>       /* The RISC-V Advanced Interrupt Architecture, Chapter 1.2. Limits */
>       g_assert(num_sources <= 1023);
>   
> +    /* Prevent IMSIC MMIO regions from silently overlapping */
> +    g_assert(s_imsic_stride >= IMSIC_HART_SIZE(imsic_num_bits(1 + aia_guests)));
> +    g_assert(m_imsic_stride >= IMSIC_HART_SIZE(0));
> +
>       if (msimode) {
>           if (!kvm_enabled()) {
>               /* Per-socket M-level IMSICs */


Reviewed-by: Portia Stephens <portias@oss.tenstorrent.com>



