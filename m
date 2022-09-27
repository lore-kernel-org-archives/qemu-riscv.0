Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oczrO-0002fb-Lf
	for mharc-qemu-riscv@gnu.org; Mon, 26 Sep 2022 21:58:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oczrN-0002fP-Vx; Mon, 26 Sep 2022 21:58:10 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:45751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oczrM-0007vd-A5; Mon, 26 Sep 2022 21:58:09 -0400
Received: by mail-pf1-x42f.google.com with SMTP id 9so8371799pfz.12;
 Mon, 26 Sep 2022 18:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=tZbZifxogii5eQgH3MUkVLhd4pGsVdDHjNT9/KMDeJ8=;
 b=n+3HnOA3icT9ax3JUoioONcQJ/pEw9BA/XVweU72GVDmTutlSp+y2YU/7ermhhi6VN
 YA1Adclkz2OvG9fGOLHZ9Bq0XxeoDqw53DJO4mxNPx0UYsFfI+vaS9cWSMT+phpsknUT
 N0sDA3sJnleerYbv7e6GH0g+ds20LjMJsRE83UhFip2+QTIb1TxmmCmNl9Ot+GdqyKAz
 baSsXRw9aRkqDLdQKsW5IuhPqOmdC8/ZVMFwYW5gQePaSXWR5ldcnyXEW5tDjSt/ni20
 jJPRulNIqYk6qlbctFMREQuqL9mowA5jukz8DNmf7DRm6Paqdf578TwdvbfoA3UE+s1G
 CdMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=tZbZifxogii5eQgH3MUkVLhd4pGsVdDHjNT9/KMDeJ8=;
 b=1ny8C1X5zKg8EbHGiI3YczABbP+Q84ACdLJ9Ip1Lf3e4HIHvZpM2TmpJdtYjjUxg1j
 PdS2tNyhI1Zey7EkafHT7IiIJwkaQledojZF4ebcI6M6NLi+hFImgZ1ZUUolNTuGTgum
 Qv9HDNPoSptpp9nxtuQcfOWSrT0J/V7LJsZzvlyBK/0Z+oDa/SenNFPNdJ/PUIQaI8yE
 R38TcydU3bK2yvSOiRWisThoea3uc1QT8iDvOGsCbXImGQXfFCLr1YF+C9GZUy6k44jt
 J3Y2P20Y2+yjO2mM39EqZ00WmR/0X2EdXG/6WQG3US4Sfkz8H3em+X3k0Qa6cz/6ALF0
 rD1w==
X-Gm-Message-State: ACrzQf0qs2CKu9Wq8fXCeuyLDppQguPCO1DYsNQwoGSP9np1e0OLpTDE
 Ht3pMPAjHS78yIoQE8BUWq1u9Cznr6oWD+6cW7I=
X-Google-Smtp-Source: AMsMyM4s7Bmg08nVPOeYNYt5P/pH7LolupYp19T2k4XexbV6ok+Lz6gDDU7pbubYhrc7sP0qmxTlLnw2pSOTpzpooAc=
X-Received: by 2002:a63:942:0:b0:43c:428d:16a9 with SMTP id
 63-20020a630942000000b0043c428d16a9mr17676672pgj.423.1664243886047; Mon, 26
 Sep 2022 18:58:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220826032258.7289-1-liuyang22@iscas.ac.cn>
 <CAKmqyKO2p8DF-e0UujtZu8gJpH+=BE6w1KZo5fA0vkK+=mk03A@mail.gmail.com>
In-Reply-To: <CAKmqyKO2p8DF-e0UujtZu8gJpH+=BE6w1KZo5fA0vkK+=mk03A@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 27 Sep 2022 11:57:39 +1000
Message-ID: <CAKmqyKNNyyC0qcPam8iYTqreAF=jYuX0=qCSe6sr2xja0g9_oQ@mail.gmail.com>
Subject: Re: [PATCH v2] disas/riscv.c: rvv: Add disas support for vector
 instructions
To: Yang Liu <liuyang22@iscas.ac.cn>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Tommy Wu <tommy.wu@sifive.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 wangjunqiang <wangjunqiang@iscas.ac.cn>, 
 =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>, 
 liweiwei <liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=alistair23@gmail.com; helo=mail-pf1-x42f.google.com
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
X-List-Received-Date: Tue, 27 Sep 2022 01:58:10 -0000

On Fri, Sep 23, 2022 at 2:27 PM Alistair Francis <alistair23@gmail.com> wrote:
>
> On Fri, Aug 26, 2022 at 1:26 PM Yang Liu <liuyang22@iscas.ac.cn> wrote:
> >
> > Tested with https://github.com/ksco/rvv-decoder-tests
> >
> > Expected checkpatch errors for consistency and brevity reasons:
> >
> > ERROR: line over 90 characters
> > ERROR: trailing statements should be on next line
> > ERROR: braces {} are necessary for all arms of this statement
> >
> > Signed-off-by: Yang Liu <liuyang22@iscas.ac.cn>
>
> Thanks!
>
> Applied to riscv-to-apply.next

This patch fails to build with this error:

../disas/riscv.c: In function 'print_insn_riscv':
../disas/riscv.c:4513:30: error: '__builtin___sprintf_chk' may write a
terminating nul past the end of the destination
[-Werror=format-overflow=]
 4513 |             sprintf(nbuf, "%d", sew);
      |                              ^
In file included from /usr/include/stdio.h:906,
                 from
/scratch/jenkins-tmp/workspace/QEMU-Multi-Config-Build/BUILD_OPTIONS/GCC/include/qemu/osdep.h:97,
                 from ../disas/riscv.c:20:
In function 'sprintf',
    inlined from 'format_inst' at ../disas/riscv.c:4513:13,
    inlined from 'disasm_inst' at ../disas/riscv.c:4640:5,
    inlined from 'print_insn_riscv' at ../disas/riscv.c:4690:5:
/usr/include/bits/stdio2.h:30:10: note: '__builtin___sprintf_chk'
output between 2 and 5 bytes into a destination of size 4
   30 |   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
      |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   31 |                                   __glibc_objsize (__s), __fmt,
      |                                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   32 |                                   __va_arg_pack ());
      |                                   ~~~~~~~~~~~~~~~~~


Alistair

> >      decode_inst_operands(&dec);
> >      decode_inst_decompress(&dec, isa);
> >      decode_inst_lift_pseudo(&dec);
> > -    format_inst(buf, buflen, 16, &dec);
> > +    format_inst(buf, buflen, 24, &dec);
> >  }
> >
> >  #define INST_FMT_2 "%04" PRIx64 "              "
> > --
> > 2.30.1 (Apple Git-130)
> >
> >

