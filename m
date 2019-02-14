Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gu5FV-0000Vc-DG
	for mharc-qemu-riscv@gnu.org; Wed, 13 Feb 2019 19:51:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60189)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gu5FT-0000Gq-Nu
	for qemu-riscv@nongnu.org; Wed, 13 Feb 2019 19:51:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gu52L-0005ya-N0
	for qemu-riscv@nongnu.org; Wed, 13 Feb 2019 19:37:58 -0500
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:35954)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gu52L-0005s6-99
	for qemu-riscv@nongnu.org; Wed, 13 Feb 2019 19:37:57 -0500
Received: by mail-pg1-x543.google.com with SMTP id r124so2040603pgr.3
	for <qemu-riscv@nongnu.org>; Wed, 13 Feb 2019 16:37:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
	:content-transfer-encoding;
	bh=LDgozyKtT2fNyBiE8cN+GXljAah1U6X0TyD3cvwjQcA=;
	b=AWDY8PH8taQJFogHaVblsege56GT0PSABRpb4ginbvatbBET6UIL84meO1PdJMyj2F
	tnoWb2c89f6lUBHVqAZK2gnFV3eofEbYUSbAyyvwrgfGtcm5uvuO+r4jLctTOJwftwB7
	T7PyzK8YHlhsrwunAtNNIEatckR29ZqpBW5xRJKgTWZI2fNVd1ndFb2tHXxEueHXoz0m
	NnysDHoTzyvVxlbjDnA4cUSEKwQf+4tCJbaiRDJz4ah3CzRGURO8kNiEcX9p14dbwHxR
	IPRRPs3DbTZNUMe1qqSU9EmZuKbagWmxGqHx0dpgpwwQrwIZV5xg2R/12af+HHen5RvT
	UORg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
	:mime-version:content-transfer-encoding;
	bh=LDgozyKtT2fNyBiE8cN+GXljAah1U6X0TyD3cvwjQcA=;
	b=IFmUDNgvQ3eCAKhH8nklSCfme8WphQwpghXs/CPW52d6bcXdh2vj1RBoCIH8pa2Qrs
	hJpff5DiZVNCaHQ/N4VaWv/vaBB0NISdwTaeVmyghZLGUUJxrhIOmH4W3VOxggoY/8i8
	KL8b09MS2s7YX6vOllrozDsec91cmb3GZbMtsb+Pbdwt2ONCTR2xsw7wgWxXmK1QagI3
	wqax5nOMmA3GryC35ti/BzAUtw075o4jtH7tsUZG8yK2h2u63C0d9L/Wqj+IRq9zqWkh
	uovcpbE/SYNdaOWBJ0p8hb1qEL8KffzDCRt2BypeROsZ/tmKNmau5Wmn7ZClEm6AOVER
	6VFQ==
X-Gm-Message-State: AHQUAuYSm51SV76I3JToShFRqQVnuZLKDumEat2+9NcyGGY7RzfqWjvt
	i2EChg+7YMI3VOGI2sX+jVUYBQ==
X-Google-Smtp-Source: AHgI3IaYE0Vp+mMAetl+LUglEmeLpSVecvoNl7sDYlsy0ybOcw8+bYaV4JvkwdVo94atsd3rEhYd8A==
X-Received: by 2002:a63:c303:: with SMTP id c3mr997005pgd.268.1550104674622;
	Wed, 13 Feb 2019 16:37:54 -0800 (PST)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	q21sm716888pfq.138.2019.02.13.16.37.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Feb 2019 16:37:53 -0800 (PST)
Date: Wed, 13 Feb 2019 16:37:53 -0800 (PST)
X-Google-Original-Date: Wed, 13 Feb 2019 16:36:12 PST (-0800)
In-Reply-To: <7a7b5675-3d66-6c87-8830-74c60f8a7471@mail.uni-paderborn.de>
CC: richard.henderson@linaro.org, peer.adelt@hni.uni-paderborn.de,
	qemu-riscv@nongnu.org, qemu-devel@nongnu.org, sagark@eecs.berkeley.edu
From: Palmer Dabbelt <palmer@sifive.com>
To: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Message-ID: <mhng-ee0701f2-0571-4996-a9e1-2e6e03dd2167@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::543
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v6 00/35] target/riscv:
 Convert to decodetree
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-riscv/>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 14 Feb 2019 00:51:32 -0000

On Wed, 13 Feb 2019 01:06:41 PST (-0800), Bastian Koppelmann wrote:
>
> On 2/13/19 3:15 AM, Palmer Dabbelt wrote:
>> On Tue, Feb 12, 2019 at 3:21 PM Palmer Dabbelt <palmer@sifive.com> wrote:
> [snip]
>>>
>>> Do you, by any chance, have a v7?  It looks like there's quite a few merge
>>> conflicts here, and while I'm OK fixing them I don't want to do it if you
>>> already have.
>>>
>> I made it through my rebase, so unless you want to send out a v7 I will.
>> There were some meaningful changes so I'd like to get a round of review
>> just so everyone is on the same page.
>
>
> Thanks for doing this work. I don't have a v7 yet, since I was waiting
> on your current pull-request to get merged. So please do send a v7, I'm
> happy to review/test it.

No problem, they're my merge conflicts :).  It's on the list.

