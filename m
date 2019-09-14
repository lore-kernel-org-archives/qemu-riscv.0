Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i97ed-0006wI-3f
	for mharc-qemu-riscv@gnu.org; Sat, 14 Sep 2019 08:59:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35290)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@dabbelt.com>) id 1i97ea-0006th-Ai
 for qemu-riscv@nongnu.org; Sat, 14 Sep 2019 08:59:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1i97eY-00007r-Sg
 for qemu-riscv@nongnu.org; Sat, 14 Sep 2019 08:59:52 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:38028)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1i97eY-00007T-NY
 for qemu-riscv@nongnu.org; Sat, 14 Sep 2019 08:59:50 -0400
Received: by mail-pf1-f193.google.com with SMTP id h195so19775448pfe.5
 for <qemu-riscv@nongnu.org>; Sat, 14 Sep 2019 05:59:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=nS/Bkx5ETvR0+ddguHIK8HfguCPB04A7fuip6hdV0zk=;
 b=U8PcKL7LkN+TtGCSoSDYFJ9pJ6zpfS++K1HWYzQWGCF4CeSEBOxPWy90B+bdnOwUUF
 b17qByY/b4LITj/uzu3mwd45w7FoRzeE1JunbWwhpO3Zpx2QjHJhABmFN0/RzCQ8S+V8
 O/G+sQvQhEckXsDmkAJJyuY+EglGEFwmxolcXElbeGa9/jQ6S25f9i5GFE+b7hXwFUh4
 w39uIedmDGUCyLQ9ZwLEaHxFlWM8TWRDISGHWpbj6dbj9vsaQuy98rlkUNaODS21DlZi
 Ms+qeTyentQXJkfwBtLHVsnQIqvchw6qXZkHAgftM2Bh1On9+BlKMML+IaAGFzzSNu6T
 RCqw==
X-Gm-Message-State: APjAAAXlQi8vRnOrzdTvqLsajZ/oasnozc59NoMJeDOTy9P5gv0uvsVJ
 W9fEfk+8ZZ6Pa+pWh/ywjL3Krw==
X-Google-Smtp-Source: APXvYqxzgTIlllV62yaI0pOs+DbLKXnTRJAMQ541M7FE42Ev7vPzdS/y7YPeA0p7PXwA6oeUFNboZw==
X-Received: by 2002:a17:90a:aa82:: with SMTP id
 l2mr11072854pjq.73.1568465989011; 
 Sat, 14 Sep 2019 05:59:49 -0700 (PDT)
Received: from localhost (amx-tls3.starhub.net.sg. [203.116.164.13])
 by smtp.gmail.com with ESMTPSA id z12sm50416072pfj.41.2019.09.14.05.59.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Sep 2019 05:59:48 -0700 (PDT)
Date: Sat, 14 Sep 2019 05:59:48 -0700 (PDT)
X-Google-Original-Date: Sat, 14 Sep 2019 05:23:48 PDT (-0700)
In-Reply-To: <CAL1e-=iyBP+k6MH+uCd7EAUAqp=hSG7SQOMemuJwdhJVGusYcg@mail.gmail.com>
CC: zhiwei_liu@c-sky.com, Alistair Francis <Alistair.Francis@wdc.com>,
 qemu-devel@nongnu.org, wenmeng_zhang@c-sky.com,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
 wxy194768@alibaba-inc.com, laurent@vivier.eu, sagark@eecs.berkeley.edu,
 qemu-riscv@nongnu.org, riku.voipio@iki.fi
From: Palmer Dabbelt <palmer@sifive.com>
To: aleksandar.m.mail@gmail.com
Message-ID: <mhng-307e8199-1ecf-4627-9d24-83656d2423f7@palmer-si-x1e>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.210.193
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v2 00/17] RISC-V: support
 vector extension
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
X-List-Received-Date: Sat, 14 Sep 2019 12:59:53 -0000

On Wed, 11 Sep 2019 00:00:56 PDT (-0700), aleksandar.m.mail@gmail.com wrote:
> 11.09.2019. 08.35, "liuzhiwei" <zhiwei_liu@c-sky.com> је написао/ла:
>>
>> Features:
>>   * support specification riscv-v-spec-0.7.1(
> https://content.riscv.org/wp-content/uploads/2019/06/17.40-Vector_RISCV-20190611-Vectors.pdf
> ).
>
> Hi, Zhivei.
>
> The linked document is a presentation, outlining general concepts of the
> instruction set in question, which is certainly useful and nice to have,
> but, for review process, we need *specifications* (especially given that
> they are in draft phase, and therefore "moving target"). Please provide
> such link.

Here's the V spec repository

    https://github.com/riscv/riscv-v-spec

and the exact 0.7.1 specification PDF

    https://github.com/riscv/riscv-v-spec/releases/download/0.7.1/riscv-v-spec-0.7.1.pdf

In RISC-V land this constitutes an official draft -- there's a whole process 
for getting a specification ratified, but that isn't done for these draft 
specifications.  The RISC-V QEMU maintainers agree that we'll take 
implementations of drafts as long as there's a concrete definition we can point 
at, like this one.

> I also noticed lack of commit messages, and was really disappointed by
> that. It looks to me you did not honor in entirety our guidlines for
> submitting patches.
>
> Yours,
> Aleksandar
>
>>   * support basic vector extension.
>
>>   * support Zvlsseg.
>
>>   * support Zvamo.
>
>>   * not support Zvediv as it is changing.
>>   * fixed VLEN 128bit.
>>   * fixed SLEN 128bit.
>>   * ELEN support 8bit, 16bit, 32bit, 64bit.
>>
>> Todo:
>>   * support VLEN configure from qemu command line.
>>   * move check code from execution-time to translation-time
>>
>> Changelog:
>> V2
>>   * use float16_compare{_quiet}
>>   * only use GETPC() in outer most helper
>>   * add ctx.ext_v Property
>>
>>
>> LIU Zhiwei (17):
>>   RISC-V: add vfp field in CPURISCVState
>>   RISC-V: turn on vector extension from command line by cfg.ext_v
>>     Property
>>   RISC-V: support vector extension csr
>>   RISC-V: add vector extension configure instruction
>>   RISC-V: add vector extension load and store instructions
>>   RISC-V: add vector extension fault-only-first implementation
>>   RISC-V: add vector extension atomic instructions
>>   RISC-V: add vector extension integer instructions part1,
>>     add/sub/adc/sbc
>>   RISC-V: add vector extension integer instructions part2, bit/shift
>>   RISC-V: add vector extension integer instructions part3, cmp/min/max
>>   RISC-V: add vector extension integer instructions part4, mul/div/merge
>>   RISC-V: add vector extension fixed point instructions
>>   RISC-V: add vector extension float instruction part1, add/sub/mul/div
>>   RISC-V: add vector extension float instructions part2,
>>     sqrt/cmp/cvt/others
>>   RISC-V: add vector extension reduction instructions
>>   RISC-V: add vector extension mask instructions
>>   RISC-V: add vector extension premutation instructions
>>
>>  linux-user/riscv/cpu_loop.c             |     7 +
>>  target/riscv/Makefile.objs              |     2 +-
>>  target/riscv/cpu.c                      |     6 +-
>>  target/riscv/cpu.h                      |    30 +
>>  target/riscv/cpu_bits.h                 |    15 +
>>  target/riscv/cpu_helper.c               |     7 +
>>  target/riscv/csr.c                      |    65 +-
>>  target/riscv/helper.h                   |   358 +
>>  target/riscv/insn32.decode              |   373 +
>>  target/riscv/insn_trans/trans_rvv.inc.c |   490 +
>>  target/riscv/translate.c                |     1 +
>>  target/riscv/vector_helper.c            | 25701
> ++++++++++++++++++++++++++++++
>>  12 files changed, 27049 insertions(+), 6 deletions(-)
>>  create mode 100644 target/riscv/insn_trans/trans_rvv.inc.c
>>  create mode 100644 target/riscv/vector_helper.c
>>
>> --
>> 2.7.4
>>
>>

