Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07AE3C5B572
	for <qemu-riscv@archiver.kernel.org>; Mon, 17 Aug 2026 12:57:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wvwtq-0001yy-9z; Mon, 17 Aug 2026 08:57:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wxchen0913@gmail.com>)
 id 1wvwto-0001yE-3p
 for qemu-riscv@nongnu.org; Mon, 17 Aug 2026 08:57:08 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wxchen0913@gmail.com>)
 id 1wvwtm-00066M-EA
 for qemu-riscv@nongnu.org; Mon, 17 Aug 2026 08:57:07 -0400
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-848643382fcso3436286b3a.1
 for <qemu-riscv@nongnu.org>; Mon, 17 Aug 2026 05:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1786971424; x=1787576224; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=VwhgCcZfQ10p7+mRK801X1VAVUGrzuWIcII2z0LM2Ho=;
 b=Gtc5aKogeb9Kcv7bTHZohNuR4L2w0CWFP22C6fZMuWcVEDzL9MvaZkEKQi3zAtV9Ms
 s5An5LTQGwr3Sa8cZjQiKYoQviMJlvAM1NuHY95jhxvQ0qsyQNZDt0UgKIdxLaCiakLc
 kVVy9lfKq7a4v/jX9A0tdn7ItLRt18qVY4v/80AKLHIxN1Mzlq1xl4ylj9Y0Msk2XD8l
 MDcnbuh/LQ9XqOLwtPa8l3dj2HJgxhDfEE/GUmFFUZnbFK/sslnvWlrZyB8q8I+sXnuR
 hEqFZvOvgcf3OZTv+EdF+baMXOMXHHGU4eMyISOGN855zUul/aeukfZje+gK5b/ScGUe
 UvVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786971424; x=1787576224;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=VwhgCcZfQ10p7+mRK801X1VAVUGrzuWIcII2z0LM2Ho=;
 b=sSQkyevnCJu2qVf7S0g38DjYb6NOrqbYgCgaFF88kxi4NBs/ZskS5k4mGyGtcSd+xQ
 gIniviKVyIzs4580i0JOajEvlcqWpK9WBmWVJQ3urp/dwjoEalzCgHIepOpVkhtq4edD
 By9s5vutORaux1YVEr+gY/mhgRJLXcwoXoYvpRQ0LsnekH1tqgF+n7V8QjSqfzbEmTwj
 xLW8fGslS6Hkb2XloC21OsLdr4Guo2E1oszO+p8yWlF+QxctkUmo0+tPZL1pwGvsBOA1
 PZFehMnd8wgcA/tI28mLyrnuCqyh20walTWwKMxfGWLoQFFFYI9ophcjmBVDPzVtPj0r
 n+ug==
X-Forwarded-Encrypted: i=1;
 AHgh+Ro5G/6TPn1CSm7go29EBqF/CB6FeHdpgc9kevccM2FDc5zWgRs78kXsTTOFs3vFqyOnbMfGaEmbjQic@nongnu.org
X-Gm-Message-State: AOJu0Yzh0xydEOB1RJNr8D7gQzglxfCEfzy4sAA6V2aUpCQP9ZK7TvlO
 SRLZZ/FHRr8KPEWBs8AtfRYagVTIA19S/AC2grgu4hbGJjIYOZwyMfRC
X-Gm-Gg: AR+sD135s7sW1UVVEwUi0YPFkW5RJoIuSiFRisDxWkN+Q8QLAHzffpARf2l6JTI8ExH
 i5Z4uQ5FxzoyBpv2gNfsAvtc/w4EV1fMTkQpfPlvnw8GXsOs/ajN0NindOcynG5b4FLSyshR/CW
 4xJt0hnloPWeixwEfBEkYvDfKlPBz3AxWIwcn8YJq7VNZoPoX5j3ukf2khGjoxrjoqpw6QF8n6O
 2hFBsz2GY2I+gVvDjSsLimGmuaPX22rs2cnI8FJ5lGpEiXZy3EEyU2yQEtJEAzi6urTcET4ndzg
 WPT/OriON63WojSjZVIq9iRVbbB12zR5OhLjDkObtiGi95N6msw+42FAJSyzNhTRVL8BCGM3ln2
 y1WYtbSl+JCGqYHNDKY8aFbBhOtYD8JggDvKM9oLvaeklRT4pYmf3HTlHany8JxFBd9etSXBO2+
 Laie1eRtlw5uUJ1JGYQqx0ztuwg+S/Uu4lhuH/EBtrFve3PcwCf3BtqGIOOkzC0Uo=
X-Received: by 2002:a05:6a00:ab8a:b0:851:804c:f4eb with SMTP id
 d2e1a72fcca58-851b87eae5dmr550593b3a.4.1786971424194; 
 Mon, 17 Aug 2026 05:57:04 -0700 (PDT)
Received: from [192.168.0.111] ([14.19.46.155])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-851b6fc0158sm240039b3a.40.2026.08.17.05.56.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Aug 2026 05:57:03 -0700 (PDT)
Message-ID: <995765d3-4c5c-4988-ac2b-ad8c97187ad9@gmail.com>
Date: Mon, 17 Aug 2026 20:56:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] hw/char: add K230 DW 8250-compatible UART
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Chao Liu <chao.liu.zevorn@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org,
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>
References: <20260808-feat-k230-uart-v3-v3-0-d73b31f0034b@gmail.com>
 <20260808-feat-k230-uart-v3-v3-1-d73b31f0034b@gmail.com>
 <0ccb0d65-b185-4700-af98-faa27a806aa4@oss.qualcomm.com>
Content-Language: en-US
From: WX Chen <wxchen0913@gmail.com>
In-Reply-To: <0ccb0d65-b185-4700-af98-faa27a806aa4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=wxchen0913@gmail.com; helo=mail-pf1-x433.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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


On 8/15/26 21:57, Philippe Mathieu-Daudé wrote:
> How much this diverges of the generic 8250 model we have?
>
> In order to reduce maintenance burden with duplicated code, the
> project preference is to use the inheritance pattern of oriented
> bject programming, in particular with QOM APIs.
>
> This model could inherit from our generic model with:
>
>   TypeInfo::parent = TYPE_SERIAL
>
> then override its specific methods.
>
> Could you have a look and justify the full rewrite? 

Hi Phil,

Thanks for the review.

The rewrite was not meant as a replacement for the generic 8250. I
was following the K230 TRM as closely as I could, and I did not
realize the preferred approach was to reuse the in-tree 8250 via
QOM rather than reimplement the 16550 core.

I agree the duplication is not justified. I will respin this to
inherit from / reuse the generic serial model as you suggested,
and keep the DesignWare probe window that Linux 8250_dw needs
(UCV/CPR/CTR/DLF/USR).

One open question: the TRM (and CPR) advertise some DesignWare
extras beyond a plain 16550 — for example a 32-byte FIFO, THRE
mode, shadow registers, and USR busy-detect. The first version
implemented several of these, which is why it grew into a full
rewrite. For the respin, should I:

   1) keep only the minimal probe window (CPR not advertising
      features the generic model does not implement), or
   2) plan follow-up work to model some of those DW extras?

I am happy either way; I mainly want to know which level of
fidelity is good.

If the pending generic dw8250 lands first, I can also switch the
K230 board over to that type instead of keeping a parallel model.

Thanks,
WX Chen


