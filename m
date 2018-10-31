Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gHzIx-0005Vn-4c
	for mharc-qemu-riscv@gnu.org; Wed, 31 Oct 2018 18:49:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43744)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gHzIv-0005VL-Hu
	for qemu-riscv@nongnu.org; Wed, 31 Oct 2018 18:49:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gHzIs-0000Ii-G7
	for qemu-riscv@nongnu.org; Wed, 31 Oct 2018 18:49:37 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:39638)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gHzIs-0000Gg-1f
	for qemu-riscv@nongnu.org; Wed, 31 Oct 2018 18:49:34 -0400
Received: by mail-wr1-x441.google.com with SMTP id r10-v6so18241076wrv.6
	for <qemu-riscv@nongnu.org>; Wed, 31 Oct 2018 15:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=9hW2RqA3QsyMCStXoV9R1VpqZA1TCEdTtpTwiNJ5r/g=;
	b=gQHwGqpsgrBvN2jRmerM7VBMBI31p62lX5uEGu4PpFMWAI/scGZJh+pcPtcm2ZAT1k
	g1N2J8RwnUVMiI0X1nkbtyRk2KwMaJOuoaHKQI8MC853eE/DRe0tnqmWR9GvKMtOIvR2
	RnPdLMP8qIIVEax4d8bCA/1s5AKkVEJg9Aq3s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=9hW2RqA3QsyMCStXoV9R1VpqZA1TCEdTtpTwiNJ5r/g=;
	b=kN5bZcv2BXgSzJY/YuBXv4n9cYbYtydsXSC6CQf5E9ms/MzrKlHbEfy+yNCaIR/nDb
	b/kRB/lGEOvjjBL3r6WGkFLNL/VqaF6Q+4O6CxbeEXau/arlaXOMGezWJO1MoBSgVUSk
	l16zfVA4mg3Yo37xUGSaAyqUWtf6zc9+DXcRq2sg/ka+oj7L1Hr8V0RnYUFii3yGWZ/E
	+h/agKNR4zJMM+A2k6xghnKYrgpGfVppfB6y4T0zH3x5Drimg127sj3l9X9FkhiJyvlf
	g/di5Y3lSrtR7+UyRXxcsYh4kJbx0SBWDFc+mNJULp2upSzoLFbD5EhOh33wgjMK/YVJ
	04BQ==
X-Gm-Message-State: AGRZ1gLZbiyaQSgrs+cVRIe7wOwZRIj5pFBWzDdjq65OEfkh3PSJRWhf
	vmD+WPqkdS7zc5S1nDVZOTN9s2ZTHDo=
X-Google-Smtp-Source: AJdET5e3DrMrshwXuc2bZZ2dSh5ss5VLaYmaUpDelHpebpeejE1ruGDWxrPxMIOuYHLhrkE/qkI1fA==
X-Received: by 2002:a5d:530c:: with SMTP id
	e12-v6mr4293758wrv.29.1541026164017; 
	Wed, 31 Oct 2018 15:49:24 -0700 (PDT)
Received: from cloudburst.twiddle.net (79-69-241-110.dynamic.dsl.as9105.com.
	[79.69.241.110]) by smtp.gmail.com with ESMTPSA id
	d7-v6sm18395045wru.39.2018.10.31.15.49.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 31 Oct 2018 15:49:23 -0700 (PDT)
To: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, mjc@sifive.com,
	sagark@eecs.berkeley.edu, palmer@sifive.com, Alistair.Francis@wdc.com
Cc: peer.adelt@hni.uni-paderborn.de, qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
References: <20181031132029.4887-1-kbastian@mail.uni-paderborn.de>
	<20181031132029.4887-36-kbastian@mail.uni-paderborn.de>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <123f566a-6a57-8b89-eb03-d9296460ab5b@linaro.org>
Date: Wed, 31 Oct 2018 22:49:21 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181031132029.4887-36-kbastian@mail.uni-paderborn.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::441
Subject: Re: [Qemu-riscv] [PATCH v3 35/35] target/riscv: Remaining rvc insn
 reuse 32 bit translators
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
X-List-Received-Date: Wed, 31 Oct 2018 22:49:38 -0000

On 10/31/18 1:20 PM, Bastian Koppelmann wrote:
> only a translate functions of rvc need to handle special cases. For
> the other rvc instruction we can remove the extra layer of indirection.
> 
> Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
> ---
>  target/riscv/insn16.decode              | 37 +++++++++----------
>  target/riscv/insn_trans/trans_rvc.inc.c | 48 -------------------------
>  2 files changed, 17 insertions(+), 68 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

