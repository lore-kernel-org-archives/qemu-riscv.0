Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gHywr-0000Ri-SH
	for mharc-qemu-riscv@gnu.org; Wed, 31 Oct 2018 18:26:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37311)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gHywp-0000Ql-NW
	for qemu-riscv@nongnu.org; Wed, 31 Oct 2018 18:26:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gHywk-0005hx-0b
	for qemu-riscv@nongnu.org; Wed, 31 Oct 2018 18:26:47 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:37579)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gHywj-0005hQ-Bb
	for qemu-riscv@nongnu.org; Wed, 31 Oct 2018 18:26:41 -0400
Received: by mail-wm1-x332.google.com with SMTP id p2-v6so15872010wmc.2
	for <qemu-riscv@nongnu.org>; Wed, 31 Oct 2018 15:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=x9j3rXfL0IpPKJNRNVdVaQGcmWKyan/E8KOZXaVBOxo=;
	b=OO13O2ZzHhUoWeovo5amZzEKLjgCD12Ka6USH99EZMNxygEsuHui+pVkBq/8v6+PEd
	PpaA/MGLU4KWT7GbNJ6W7JA5m+WQNchgTE+XLgkl38+1RTHhi75fDK1eYnjakdPhjoqI
	3/VTpk/wZtiuheHjTuqhj86c/RZfxrRaWwUTk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=x9j3rXfL0IpPKJNRNVdVaQGcmWKyan/E8KOZXaVBOxo=;
	b=Hd+7BWEozdDxnnaxnBbdvFCoiioVZmDaHxG5M5pZhI1NRiJ5UYSr3PbEM2a+Z1J13l
	SivgBO59sbizUk2Qdl3O2SseuZ1IjH8WH3KmvGyEC2XmXl7q32XLdc667DsfiXjVU6O5
	CejDEPeOJrjMtWVaA1exKuFE/i0qh11sed1qHpB2zgT1gOM+2kG7W957yPGsSynWmvx3
	x78/dDn8biLtYGwfjBayenKHUAhX1pnrPpvakZjeOl/9Krzmp1qXY+AXsBG1j03xg+oC
	pQiqM6oQXfnogzLjd5xpZi5mkSJDNE9pS1jTIGG1WYERY1O2JoLXinWMduhT3kcGtFUb
	2H8w==
X-Gm-Message-State: AGRZ1gJi1EY6BzN0LORxjIt3ExhAIPpYmZDl4SaHaMcm5FlI6I2JBB6F
	RSyACMYX4BD2vhfVPfKO7K5/DyhsqK4=
X-Google-Smtp-Source: AJdET5e2x950YE53UNm2YfSLgSvpd/vArjPTwmbzR22cCaynbI8miJdDtEYigV2u62XrtSFaHaJ4Yw==
X-Received: by 2002:a1c:603:: with SMTP id 3-v6mr3699729wmg.64.1541024799347; 
	Wed, 31 Oct 2018 15:26:39 -0700 (PDT)
Received: from cloudburst.twiddle.net (79-69-241-110.dynamic.dsl.as9105.com.
	[79.69.241.110]) by smtp.gmail.com with ESMTPSA id
	143-v6sm24063869wmv.6.2018.10.31.15.26.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 31 Oct 2018 15:26:38 -0700 (PDT)
To: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, mjc@sifive.com,
	sagark@eecs.berkeley.edu, palmer@sifive.com, Alistair.Francis@wdc.com
Cc: peer.adelt@hni.uni-paderborn.de, qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
References: <20181031132029.4887-1-kbastian@mail.uni-paderborn.de>
	<20181031132029.4887-26-kbastian@mail.uni-paderborn.de>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <75754b54-6527-7cdb-b387-5917e00ad086@linaro.org>
Date: Wed, 31 Oct 2018 22:26:37 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181031132029.4887-26-kbastian@mail.uni-paderborn.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::332
Subject: Re: [Qemu-riscv] [PATCH v3 25/35] target/riscv: make
 ADD/SUB/OR/XOR/AND insn use arg lists
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
X-List-Received-Date: Wed, 31 Oct 2018 22:26:48 -0000

On 10/31/18 1:20 PM, Bastian Koppelmann wrote:
>  static bool trans_addw(DisasContext *ctx, arg_addw *a)
>  {
> -    gen_arith(ctx, OPC_RISC_ADDW, a->rd, a->rs1, a->rs2);
> -    return true;
> +    return trans_arith(ctx, a, &tcg_gen_add_tl);
>  }

This should be using gen_addw.


r~

