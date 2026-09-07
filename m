Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E4B1C79F8C
	for <qemu-riscv@archiver.kernel.org>; Mon,  7 Sep 2026 02:28:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x3P5E-0007eg-2G; Sun, 06 Sep 2026 22:27:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1x3P5C-0007eJ-Jo
 for qemu-riscv@nongnu.org; Sun, 06 Sep 2026 22:27:42 -0400
Received: from mail-yx1-xb132.google.com ([2607:f8b0:4864:20::b132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1x3P5A-0007Bq-Cg
 for qemu-riscv@nongnu.org; Sun, 06 Sep 2026 22:27:42 -0400
Received: by mail-yx1-xb132.google.com with SMTP id
 956f58d0204a3-66d29b298a4so962810d50.1
 for <qemu-riscv@nongnu.org>; Sun, 06 Sep 2026 19:27:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788748059; cv=none;
 d=google.com; s=arc-20260327;
 b=BIEPCwnKQbUsGIP2FctwYRAQR/S5r6CWZ6SteXaqPAsZa/QToz665nz3ty1Lv9n8hL
 LJUwhQsRibD1gVl3ztaXAnzf2ceqYxRvmY7XQNspEAWLjA66YR7EHkiY1ZyYgCW4DL1M
 lvzO6s9LtUK34wRvR8ljWg8juUjDsIdiS4M8nv5hvvJzAv/3iKccHD/BqIFydxk7yx9Z
 82eYQOr7g/PpB4RvFuexfc3sc6HpQeJ8IbzpgOlvTjahhT2IPgBfvaUTAuLhYpMhsKKF
 ljmIBwW2FjvPj9sIEt8XP+cIWb0WBM3sQ3mNF60Qp0l8Tu2KDaoz4fRajNl6BucvCEhk
 BKiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=Fmo+ecuEKQm+N37XLc/59ti0srpTndziRJEkJ+jpT3w=;
 fh=MpCZEuAfjQ7o/I8xkAdN7FUIwXKxmdlp9xdVuex3YQk=;
 b=Sc6fjSXiPxj07kC+cJn75C23dzWSeeH+xCP4u1KDnj+Q5WdI+ng3uegyszgiDOm810
 QosYmw7r7reU4tMwi6GPgcDfARPBCEogxRJTLu/eOGbQXOlxkhvYYAH21ho0z6L14JJ6
 7NYQ1oIRS8J3BGMJVQv7CXXQPoeu6XxFarqHUx6AXscZmVqaNQ2LiY4UBWFGxZKN4a/2
 tZCa5J5nllNCp/nkWwxWna4gi0WBHEQYAJaRhpRSICGvgk06tXXSHLna59KtcsPd2Foz
 ey30EZwKlmNF+7XXbsKPbkxHQ+m1swXzQQDEsJ9GSdR9bqJzauLOJmYbtvQSSWHMUE0i
 c+ww==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jms.id.au; s=google; t=1788748059; x=1789352859; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=Fmo+ecuEKQm+N37XLc/59ti0srpTndziRJEkJ+jpT3w=;
 b=Nx1kW60kZbuNIVQmeRqzFWGNC3o6e1FQpSVIPgE8KjfeAT7FQ5ia2cBzgiLd1vGMQI
 j53IouVxPif6wVhXmj2w+l0X+eBWE3Zbv2qpF046gcQ0ptL/+ohfMsqKRwmTv+2VkWMg
 9DkkLFang8CSsqYf73cJAnT0JH5jhoUABnsxc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788748059; x=1789352859;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=Fmo+ecuEKQm+N37XLc/59ti0srpTndziRJEkJ+jpT3w=;
 b=IztcgNZF/cADlAB/Ej6kAbB4Oe3njglg+yB4SVCd5LV+3QWrQsP18TCRMABNTJBMwC
 sT5ZFhV7pzmuZxazUDIJS8vuPAn7HytQL5Xv6UBIo6MMuBKokS/xoqdYhUXyyv7UzpBM
 qdZvZE+d6B3ktNCYYNx+LC3Dv10qgdxRCtHXRHgqyHB+Hl3x7TV9Rdj+5vOioIoZpoH/
 F+5iRN1OOLO3/6BWN1RCxPw3YozO5nHOCEPaoI8wJKupUs77iFX1wo3fJO74YKy5oA06
 FUQkqmiW3KyI3HiPhdivlHmwx89GmS+PtqEa1SKjm4huITikHtCnSyWLsoKL9itsLph0
 FYzg==
X-Forwarded-Encrypted: i=1;
 AKwUvBwhISKgKZ7C2GZndVdqpD02PuHJyhXPuX59qWmSMCiJbnH86qcaCPOAx8YzY906lXCv7zShtwyhjCF8@nongnu.org
X-Gm-Message-State: AFuF++mqm/el1vlXKaENMVPgrUz9xgxUnylE75rVJSEbjHw1EQ6qudRk
 f2Ez03QW+xNGbcXBqR90daXenF+LWudJB73uueqJt2E9r2pJ0qNVsMiep6AowSRF4Wb6Pr0sdVP
 zyxdS+F3gwIw0ZOTko2OsyRc0c50NQJY=
X-Gm-Gg: AYBFou2de0wfKqW2wXYWaRKre8esC4ARs5gEhYI6jiMwH3upo7r3eqkffaidnres/e8
 tCTFHr0KEGXxpz4W2BztnuPAgrsR05rE87g8ZPOqyLWpJEwfBRCKjZ/fws12oYoZ7I+o1fPMqM5
 YZFUIUwV/h2JOzKB/r8ncKGrjRIPI/tEoL0MzGRy9+JuJGWytVF6PICZVGVIK5rnB5Q0IiHKtL/
 8c5/GA3XzNi0g/X60H4s4w+SOSR81cBebW3lNG1zw5ENGTEuDh63twcrkTdwCFgFYKPYo3+YqkY
 1PcqKV5/SWklusywpBdrI+TWexE5GSF7slyoHc5xuuEviX5vAFjA/HHiWCFEWBk+U8Mjt7ZuKgb
 o9vw4JBbvanprzfDd+y6S2FQIMvQ6D5K1HqL7aVtlUflvRNQLx0c8ReqzM8ySncI5lTwKGg9IfS
 u4MEllfvKn1sjkOk4AaAy6Pzvs7YM=
X-Received: by 2002:a53:d012:0:b0:66a:b15e:bb93 with SMTP id
 956f58d0204a3-66fb6d605fdmr2544848d50.13.1788748059166; Sun, 06 Sep 2026
 19:27:39 -0700 (PDT)
MIME-Version: 1.0
References: <20260831133000.982059-1-liumingliang.dev@bytedance.com>
 <20260831133000.982059-4-liumingliang.dev@bytedance.com>
In-Reply-To: <20260831133000.982059-4-liumingliang.dev@bytedance.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 7 Sep 2026 11:57:28 +0930
X-Gm-Features: AcwNN1WfmvzMZ69dvtEJC7ehjUvqaRiP4ezxDBKui0LJoE-ot9q9IAqmOLnmySA
Message-ID: <CACPK8Xc4u-79Tcga3tw3PKj9g3Om79evM1qK38d9pfbVi9kzeg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] tests/tcg/riscv64: Add tests for Zvabd extension
To: Mingliang Liu <liumingliang.dev@bytedance.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, palmer@dabbelt.com, 
 Alistair.Francis@wdc.com, zhiwei_liu@linux.alibaba.com, liwei1518@gmail.com, 
 daniel.barboza@oss.qualcomm.com, chao.liu@processmission.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b132;
 envelope-from=joel.stan@gmail.com; helo=mail-yx1-xb132.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On Mon, 31 Aug 2026 at 23:00, Mingliang Liu
<liumingliang.dev@bytedance.com> wrote:
>
> Co-Auther: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

Typo: Co-Author

This should include a Signed-off-by from Daniel as well.

Mention in the commit message that the assembler doesn't support the
opcodes yet so instructions are hardcoded for the time being.

Also worth mentioning that binutils/gas 2.47 has the 0.7 opcodes(!),
so the test should never be built with that version, even once support
is changed over to use the mnemonics.

https://github.com/gnutools/binutils-gdb/commit/d3b84dac949ac10f8736c85253b4a1073d244ac1

> Signed-off-by: Mingliang Liu <liumingliang.dev@bytedance.com>
> ---
>  tests/tcg/riscv64/Makefile.softmmu-target |   8 +
>  tests/tcg/riscv64/test-zvabd.S            | 659 ++++++++++++++++++++++
>  2 files changed, 667 insertions(+)
>  create mode 100644 tests/tcg/riscv64/test-zvabd.S
>
> diff --git a/tests/tcg/riscv64/Makefile.softmmu-target b/tests/tcg/riscv64/Makefile.softmmu-target
> index 6a219c306c..787fdaab40 100644
> --- a/tests/tcg/riscv64/Makefile.softmmu-target
> +++ b/tests/tcg/riscv64/Makefile.softmmu-target
> @@ -71,5 +71,13 @@ EXTRA_RUNS += run-test-misa-w
>  run-test-misa-w: test-misa-w
>         $(call run-test, $<, $(QEMU) -cpu rv64$(comma)x-misa-w=true$(comma)c=true$(comma)v=true $(QEMU_OPTS)$<)
>
> +EXTRA_RUNS += run-test-zvabd
> +ZVABD_CPU = rv64$(comma)v=true$(comma)vlen=256$(comma)x-zvabd=true
> +CLEANFILES += test-zvabd
> +test-zvabd: test-zvabd.o $(LINK_SCRIPT)
> +       $(LD) $(LDFLAGS) $< -o $@
> +run-test-zvabd: test-zvabd
> +       $(call run-test, $<, $(QEMU) -cpu $(ZVABD_CPU) $(QEMU_OPTS)$<)
> +
>  # We don't currently support the multiarch system tests
>  undefine MULTIARCH_TESTS
> diff --git a/tests/tcg/riscv64/test-zvabd.S b/tests/tcg/riscv64/test-zvabd.S
> new file mode 100644
> index 0000000000..01db2fd7dc
> --- /dev/null
> +++ b/tests/tcg/riscv64/test-zvabd.S
> @@ -0,0 +1,659 @@
> +/*
> + * Test the Zvabd vector absolute-difference instructions and the vabs.v
> + * pseudoinstruction.
> + *

> +test_vabs_v:
> +       vsetivli zero, 2, e8, m1, ta, ma
> +
> +       /* Load .arr_neg array in v1 */
> +       la     t0,.arr_neg
> +       vle8.v v1,0(t0)
> +
> +       /* vabs.v v2, v1 (vabd.vx v2, v1, x0) raw opcode */
> +       .word   0x56106157

Palmer mentioned using .insn instead of .word. It is a little bit
easier to check than the raw .word:

.insn r 0x57, 0x6, 0x2b, x2, x0, x1

I don't have a strong opinion either way.

