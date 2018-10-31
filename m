Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gHzFK-0003ot-Hl
	for mharc-qemu-riscv@gnu.org; Wed, 31 Oct 2018 18:45:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42808)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gHzFI-0003nR-2Y
	for qemu-riscv@nongnu.org; Wed, 31 Oct 2018 18:45:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gHzFF-0007GW-2Q
	for qemu-riscv@nongnu.org; Wed, 31 Oct 2018 18:45:52 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:35128)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gHzFE-0007E8-MC
	for qemu-riscv@nongnu.org; Wed, 31 Oct 2018 18:45:48 -0400
Received: by mail-wm1-x342.google.com with SMTP id q12-v6so13255226wmq.0
	for <qemu-riscv@nongnu.org>; Wed, 31 Oct 2018 15:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=scnf5L8v7WrJYqJt9ZmxdXIfIpN5WJfwSvJXbVEUzwo=;
	b=KdGvSCsUOS/Y++9YoRh4IrQ2+MaIeeDgac248xu4YiVOBn309dKbXtxwBn9JvoY/zE
	tRUeMb40JpgI1aVfU1Z6vM/fLKRFMgIjnY5Up3/4FZXlEZ6tzwBarGPRTsryKjy4CxT2
	K24zxLxa0QL5mA4EHu5hkX5FRTzw5p6crgxmU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=scnf5L8v7WrJYqJt9ZmxdXIfIpN5WJfwSvJXbVEUzwo=;
	b=gPgIpIvlhMYhOz6pAAq/8uZzg/OcYkPkM1CDbGXt8kkQcOHaJ3Wv/oi8EBIQyNzdS+
	AInPTwe36NPWCnIgul/4WjNvpt/FRuvvJXTsG8VyDutPkB+wvXFy0Kc8KbszeataH3/n
	8DO0M1BP4n8tUQUqw+rPQjaxtOMXRFddnc6Ifuj8ILyi7iHSNDh7QPkg7HacnO3QicjZ
	gbryk8GgxMdCT3lgZ0psXsGo6o7DypfDvZQyAz6jqLMBJk2xq5Uke738/XykbT+6cxgL
	SperGZbHGlCT+e1us0sfOfrAT8fn0668JxSbEoS0Dbn2RUlMd3f9UMCYEYVTel4yrZL7
	SdmQ==
X-Gm-Message-State: AGRZ1gJCApIWyQ/q5L+TB1bk2+qxneVLQwMBy2LQCaKo1i4sClRZ7S3R
	RW6F3qY4bm8avdJxa2sEvEetoSBPAgM=
X-Google-Smtp-Source: AJdET5eErULRObdjDoR3rzTMxpBNkRDb/zch3bx+BOIi/wCF0hHZ8y6KG66d/TTwFDoPquqRy21KMw==
X-Received: by 2002:a1c:9008:: with SMTP id s8-v6mr3776993wmd.20.1541025947354;
	Wed, 31 Oct 2018 15:45:47 -0700 (PDT)
Received: from cloudburst.twiddle.net (79-69-241-110.dynamic.dsl.as9105.com.
	[79.69.241.110]) by smtp.gmail.com with ESMTPSA id
	o4-v6sm21587480wrj.45.2018.10.31.15.45.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 31 Oct 2018 15:45:46 -0700 (PDT)
To: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, mjc@sifive.com,
	sagark@eecs.berkeley.edu, palmer@sifive.com, Alistair.Francis@wdc.com
Cc: peer.adelt@hni.uni-paderborn.de, qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
References: <20181031132029.4887-1-kbastian@mail.uni-paderborn.de>
	<20181031132029.4887-34-kbastian@mail.uni-paderborn.de>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <db2a445a-ec2b-2c1c-fd2f-8c4acb11e1ec@linaro.org>
Date: Wed, 31 Oct 2018 22:45:45 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181031132029.4887-34-kbastian@mail.uni-paderborn.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::342
Subject: Re: [Qemu-riscv] [PATCH v3 33/35] target/riscv: Splice fsw_sd and
 flw_ld for riscv32 vs riscv64
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
X-List-Received-Date: Wed, 31 Oct 2018 22:45:52 -0000

On 10/31/18 1:20 PM, Bastian Koppelmann wrote:
> this finally removes the old decoder functions that we carried along
> with it.
> 
> Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
> ---
>  target/riscv/Makefile.objs              |   1 +
>  target/riscv/insn16-32.decode           |  24 ++++
>  target/riscv/insn16-64.decode           |   4 +
>  target/riscv/insn16.decode              |   7 +-
>  target/riscv/insn_trans/trans_rvc.inc.c |  22 ----
>  target/riscv/translate.c                | 165 +-----------------------
>  6 files changed, 31 insertions(+), 192 deletions(-)
>  create mode 100644 target/riscv/insn16-32.decode

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

