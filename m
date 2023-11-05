Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6411C4332F
	for <qemu-riscv@archiver.kernel.org>; Sun,  5 Nov 2023 12:17:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qzc4I-0000W5-RD; Sun, 05 Nov 2023 07:17:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1qzc4I-0000Vp-4G
 for qemu-riscv@nongnu.org; Sun, 05 Nov 2023 07:17:30 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1qzc4G-0008Ag-2W
 for qemu-riscv@nongnu.org; Sun, 05 Nov 2023 07:17:29 -0500
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-1cc5fa0e4d5so32396345ad.0
 for <qemu-riscv@nongnu.org>; Sun, 05 Nov 2023 04:17:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1699186646; x=1699791446;
 darn=nongnu.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SeSAy6CaTtpqhdSyHQCwmDvDBGSEd3nXyY7i9vBAN/w=;
 b=N/t32aQaYMFPRQLN2tdsOlNfCdQyNfRE3vs6BWUniTsx4mh8fcJ3gU3oCRlpwOPKwj
 wNwSEu/IfL8BbaGeCiGMFdrtc0gh1OB5PSofi1tB8iLPoQFaaa9P5T+ThnXJK71o4SRa
 0q85bmgyPGTRlJ7ovRfuaHU3h4P9CmKGM6SjdGBnMMIvBmB8jHHFTDEaf9HmJYmpaHSI
 5su+XQJfYNICsAlBsttaGDh++aZIcwNq9fbrZFQnt1/EBj0gyexlR7NTSj9U0yJR4HxL
 ILyrofGQBD4/PvQkYA2VwI9xcl0opT6mH7A9EmM2iPjEI3kV7ojPdyuwuVMnN1uJK572
 AZHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699186646; x=1699791446;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SeSAy6CaTtpqhdSyHQCwmDvDBGSEd3nXyY7i9vBAN/w=;
 b=G3d24+c2xmHGekmS+W5VpJ1plEsjbsqki5X1564ktBgVYFyTBrqhJrQd6b2GIxjXlV
 nan3fuspqhOidjIee3c5O9wo0Gn5LRGBo7B6hvpoXfssJOJPNQqyA7kAY2fyq/492ghQ
 SXUeRNa8yQ2vhQXMS5gjUFwiK3x2faW3v20hIHcXAc9w7NOBw6Xn8sDPZDMm1pqd4GF2
 oApTxPMfih8ie8ODpRFWaokf+chPhmcup2jm4T52O/wt1NWFyvsVX4kWp5x/SUQyHHuK
 N9DygTokKMhwCs1DMxVIZE3rBZiiRW5GGu+PAflF3OU1Oh90ApvAWl36Y3c7F5Q/f+Wi
 tqDQ==
X-Gm-Message-State: AOJu0YzlhdrR/fs55dwkaG1AHWuq67J11R15fgDrNY48ZoxY7u0zHloz
 Xu9xYo9iRzccSPgiReXbYEhNgA==
X-Google-Smtp-Source: AGHT+IEddoUQay+8ZE9xXcKrOyoFFrBQzIfOn8VssoA27aSnXsMEhr+vQNdg8V2RXaSSmp0GYw3KfA==
X-Received: by 2002:a17:903:288b:b0:1c5:6157:f073 with SMTP id
 ku11-20020a170903288b00b001c56157f073mr26337827plb.11.1699186645690; 
 Sun, 05 Nov 2023 04:17:25 -0800 (PST)
Received: from ?IPV6:2400:4050:a840:1e00:78d2:b862:10a7:d486?
 ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
 by smtp.gmail.com with ESMTPSA id
 i10-20020a170902c94a00b001b8a00d4f7asm4140306pla.9.2023.11.05.04.17.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Nov 2023 04:17:25 -0800 (PST)
Message-ID: <a28e343f-d864-4817-9ef4-75d6f0f1c291@daynix.com>
Date: Sun, 5 Nov 2023 21:17:16 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/29] tests/tcg: add an explicit gdbstub register tester
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Song Gao <gaosong@loongson.cn>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, Paolo Bonzini <pbonzini@redhat.com>,
 David Hildenbrand <david@redhat.com>, Brian Cain <bcain@quicinc.com>,
 qemu-ppc@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-s390x@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Nicholas Piggin <npiggin@gmail.com>, Thomas Huth <thuth@redhat.com>,
 John Snow <jsnow@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Bin Meng <bin.meng@windriver.com>, Beraldo Leal <bleal@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Michael Rolnik <mrolnik@gmail.com>, Luis Machado <luis.machado@linaro.org>
References: <20231103195956.1998255-1-alex.bennee@linaro.org>
 <20231103195956.1998255-7-alex.bennee@linaro.org>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20231103195956.1998255-7-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::62e;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 2023/11/04 4:59, Alex Bennée wrote:
> We already do a couple of "info registers" for specific tests but this
> is a more comprehensive multiarch test. It also has some output
> helpful for debugging the gdbstub by showing which XML features are
> advertised and what the underlying register numbers are.
> 
> My initial motivation was to see if there are any duplicate register
> names exposed via the gdbstub while I was reviewing the proposed
> register interface for TCG plugins.
> 
> Mismatches between the xml and remote-desc are reported for debugging
> but do not fail the test.
> 
> Cc: Akihiko Odaki <akihiko.odaki@daynix.com>
> Cc: Luis Machado <luis.machado@linaro.org>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20231012170426.1335442-1-alex.bennee@linaro.org>
> 
> ---
> v2
>    - remove python2 compat bits
>    - add SPDX header, clean up comment lines
>    - fix duplicate check
>    - use field 6 (Rmt Nr) instead of field 1 (Nr) for cross-check
>    - more useful output on finding a duplicates and missing regs
>    - handle non-XML targets cleanly
> ---
>   tests/tcg/multiarch/Makefile.target           |  11 +-
>   tests/tcg/multiarch/gdbstub/registers.py      | 188 ++++++++++++++++++
>   .../multiarch/system/Makefile.softmmu-target  |  13 +-
>   3 files changed, 210 insertions(+), 2 deletions(-)
>   create mode 100644 tests/tcg/multiarch/gdbstub/registers.py
> 
> diff --git a/tests/tcg/multiarch/Makefile.target b/tests/tcg/multiarch/Makefile.target
> index f3bfaf1a22..d31ba8d6ae 100644
> --- a/tests/tcg/multiarch/Makefile.target
> +++ b/tests/tcg/multiarch/Makefile.target
> @@ -93,12 +93,21 @@ run-gdbstub-thread-breakpoint: testthread
>   		--qemu $(QEMU) --qargs "$(QEMU_OPTS)" \
>   		--bin $< --test $(MULTIARCH_SRC)/gdbstub/test-thread-breakpoint.py, \
>   	hitting a breakpoint on non-main thread)
> +
> +run-gdbstub-registers: sha512
> +	$(call run-test, $@, $(GDB_SCRIPT) \
> +		--gdb $(GDB) \
> +		--qemu $(QEMU) --qargs "$(QEMU_OPTS)" \
> +		--bin $< --test $(MULTIARCH_SRC)/gdbstub/registers.py, \
> +	checking register enumeration)
> +
>   else
>   run-gdbstub-%:
>   	$(call skip-test, "gdbstub test $*", "need working gdb with $(patsubst -%,,$(TARGET_NAME)) support")
>   endif
>   EXTRA_RUNS += run-gdbstub-sha1 run-gdbstub-qxfer-auxv-read \
> -	      run-gdbstub-proc-mappings run-gdbstub-thread-breakpoint
> +	      run-gdbstub-proc-mappings run-gdbstub-thread-breakpoint \
> +	      run-gdbstub-registers
>   
>   # ARM Compatible Semi Hosting Tests
>   #
> diff --git a/tests/tcg/multiarch/gdbstub/registers.py b/tests/tcg/multiarch/gdbstub/registers.py
> new file mode 100644
> index 0000000000..2aa0c30165
> --- /dev/null
> +++ b/tests/tcg/multiarch/gdbstub/registers.py
> @@ -0,0 +1,188 @@
> +# Exercise the register functionality by exhaustively iterating
> +# through all supported registers on the system.
> +#
> +# This is launched via tests/guest-debug/run-test.py but you can also
> +# call it directly if using it for debugging/introspection:
> +#
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +
> +import gdb
> +import sys
> +import xml.etree.ElementTree as ET
> +
> +initial_vlen = 0

This seems unused.

> +failcount = 0
> +
> +def report(cond, msg):
> +    "Report success/fail of test."
> +    if cond:
> +        print("PASS: %s" % (msg))
> +    else:
> +        print("FAIL: %s" % (msg))
> +        global failcount
> +        failcount += 1

I suggest using unittest to remove this boilerplate.

> +
> +
> +def fetch_xml_regmap():
> +    """
> +    Iterate through the XML descriptions and validate.
> +
> +    We check for any duplicate registers and report them. Return a
> +    reg_map hash containing the names, regnums and initial values of
> +    all registers.
> +    """
> +
> +    # First check the XML descriptions we have sent. Most arches
> +    # support XML but a few of the ancient ones don't in which case we
> +    # need to gracefully fail.
> +
> +    try:
> +        xml = gdb.execute("maint print xml-tdesc", False, True)
> +    except (gdb.error):
> +        print("SKIP: target does not support XML")
> +        return None
> +
> +    total_regs = 0
> +    reg_map = {}
> +    frame = gdb.selected_frame()
> +
> +    tree = ET.fromstring(xml)
> +    for f in tree.findall("feature"):
> +        name = f.attrib["name"]
> +        regs = f.findall("reg")
> +
> +        total = len(regs)
> +        total_regs += total
> +        base = int(regs[0].attrib["regnum"])
> +        top = int(regs[-1].attrib["regnum"])
> +
> +        print(f"feature: {name} has {total} registers from {base} to {top}")
> +
> +        for r in regs:
> +            name = r.attrib["name"]
> +            regnum = int(r.attrib["regnum"])
> +            value = frame.read_register(name).__str__()

Does it really need conversion to string?

> +            entry = { "name": name, "initial": value, "regnum": regnum }
> +
> +            if name in reg_map:
> +                report(False, f"duplicate register {entry} vs {reg_map[name]}")
> +                continue
> +
> +            reg_map[name] = entry
> +
> +    # Validate we match
> +    report(total_regs == len(reg_map.keys()),
> +           f"counted all {total_regs} registers in XML")
> +
> +    return reg_map
> +
> +def crosscheck_remote_xml(reg_map):
> +    """
> +    Cross-check the list of remote-registers with the XML info.
> +    """
> +
> +    remote = gdb.execute("maint print remote-registers", False, True)
> +    r_regs = remote.split("\n")
> +
> +    total_regs = len(reg_map.keys())
> +    total_r_regs = 0
> +
> +    for r in r_regs:
> +        fields = r.split()
> +        # Some of the registers reported here are "pseudo" registers that
> +        # gdb invents based on actual registers so we need to filter them
> +        # out.
> +        if len(fields) == 8:
> +            r_name = fields[0]
> +            r_regnum = int(fields[6])
> +
> +            # check in the XML
> +            try:
> +                x_reg = reg_map[r_name]
> +                x_reg["seen"] = True

Place x_reg["seen"] out of this try block.

