Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hGRnW-0003Re-Ej
	for mharc-qemu-riscv@gnu.org; Tue, 16 Apr 2019 13:23:06 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36814)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hGRnT-0003Qj-V5
	for qemu-riscv@nongnu.org; Tue, 16 Apr 2019 13:23:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hGRnS-0006RX-W0
	for qemu-riscv@nongnu.org; Tue, 16 Apr 2019 13:23:03 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:37356)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hGRnS-0006Q4-K8
	for qemu-riscv@nongnu.org; Tue, 16 Apr 2019 13:23:02 -0400
Received: by mail-pf1-x443.google.com with SMTP id 8so10735756pfr.4
	for <qemu-riscv@nongnu.org>; Tue, 16 Apr 2019 10:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=9ireNXBEenac/bpbP2qhhiCHhvW1o/b4CWXejO6S1ZY=;
	b=ZNMBiH1pqVRL666B5ZlIeUsk3NQewI/ZuL3sGngtPWU/zRjwYdk+PNhl9/0vFTZfsU
	xTAHTQViYb2ln7n6I2LDO4j2jii4hpKt49LoJy2GPUr8cCR35NMT05q+B93xFwVR4w/8
	mS6zmgqcBK1teYr5489NYK/q4754jf14mZWH2Y/Y0w2l2XLK1xDuPantcAsm666ZOpRv
	Yi6ja3nlDSe6aWAs/I888cKsPUFM6zItkSIAfAselSttqNsouB6OhFMB++jxNYIINjv4
	UR6cfD2J/jDykEGn2VufTCEGVYCVobI9tyT/yhCo82Rl2J3GWlTAW+RhgvsfMZqdxkQP
	8Sfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=9ireNXBEenac/bpbP2qhhiCHhvW1o/b4CWXejO6S1ZY=;
	b=MUlKyCT2E/k5AN5DmMK4R3qqHzhNUF/72ebfokbYb3sJ/y7qQdw1TBv69cCA+rteJS
	13SneXNI5qOWDPmXQmFEOlB2ujvN8LiffTamG1X/VDjI9Y+SjtABzDH/kPvdKpp1vjNk
	vSvtDnOZQEvKoTU9sGd3rYH5bQSIrn+zMXOfZcV0vWnk8Wfyo9ZZXmQqYPjTAql0mvX9
	RoRcP/O2p/HjMKWqSSO0yMOrW4d5ai4bLvXOahcDtBNUQBuIb5ArF3L/Y0klpHj8JUnH
	fODbs+pwiJaPbt7uX6tVDGepMG8pPhMsd4V/6R6Yta8UD94hXJwP0s5+9FbHxIilFJ5S
	0Bag==
X-Gm-Message-State: APjAAAWp/d4Lpnfe6bDwPjUQ04VuGFZZPYFC9nd51rweGM5AXAJpsmLv
	RBsqGXh7/M79Kx8fBRcwL8PFCSt/R/c=
X-Google-Smtp-Source: APXvYqy8gXc5B34agVJd8MihQzZ560DKc9MAxgRaLT3m/yqdq3lcgFJOCGutCDsGYvDH6lSxVK08Ow==
X-Received: by 2002:a62:19c3:: with SMTP id 186mr85403794pfz.172.1555435380730;
	Tue, 16 Apr 2019 10:23:00 -0700 (PDT)
Received: from [172.20.101.138] (rrcs-66-91-136-155.west.biz.rr.com.
	[66.91.136.155]) by smtp.gmail.com with ESMTPSA id
	w10sm53683820pfi.126.2019.04.16.10.22.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 16 Apr 2019 10:22:59 -0700 (PDT)
To: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, qemu-devel@nongnu.org
Cc: palmer@sifive.com, Alistair.Francis@wdc.com, qemu-riscv@nongnu.org
References: <20190401031155.21293-1-richard.henderson@linaro.org>
	<20190401031155.21293-4-richard.henderson@linaro.org>
	<c6b66db9-24d5-b55b-8b45-e73f3d7c3fba@mail.uni-paderborn.de>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <50effb1c-3bbe-126b-9bfb-0b65eacc9c36@linaro.org>
Date: Tue, 16 Apr 2019 07:22:55 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <c6b66db9-24d5-b55b-8b45-e73f3d7c3fba@mail.uni-paderborn.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::443
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH for-4.1 3/8] target/riscv:
 Merge argument sets for insn32 and insn16
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
X-List-Received-Date: Tue, 16 Apr 2019 17:23:05 -0000

On 4/16/19 2:02 AM, Bastian Koppelmann wrote:
> 
> On 4/1/19 5:11 AM, Richard Henderson wrote:
>>     # *** RV64C Standard Extension (Quadrant 0) ***
>>   c_addi4spn        000    ........ ... 00 @ciw
>> -c_fld             001  ... ... .. ... 00 @cl_d
>> -c_lw              010  ... ... .. ... 00 @cl_w
>> +fld               001  ... ... .. ... 00 @cl_d
>> +lw                010  ... ... .. ... 00 @cl_w
> 
> This leads to a redefinition of arg_lw and arg_fld for which clang emits a
> warning as found by Peter as he wanted to merge the original pull request for
> RISC-V-dt. The same goes for all other merged args.

I thought that would be handled by the #pragma, but it seems
that we need another one for clang-6.


r~


diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index fb66e886bf..c96c616539 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -695,6 +695,7 @@ static bool gen_shift(DisasContext *ctx, arg_r *a,
  */
 #pragma GCC diagnostic push
 #pragma GCC diagnostic ignored "-Wredundant-decls"
+#pragma GCC diagnostic ignored "-Wtypedef-redefinition"

 #include "decode_insn16.inc.c"



