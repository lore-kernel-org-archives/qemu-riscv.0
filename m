Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C519EC44507
	for <qemu-riscv@archiver.kernel.org>; Fri, 17 Jul 2026 08:55:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wkeM1-00082j-55; Fri, 17 Jul 2026 04:55:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wkeLy-000824-08
 for qemu-riscv@nongnu.org; Fri, 17 Jul 2026 04:55:30 -0400
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wkeLv-0005Ll-G8
 for qemu-riscv@nongnu.org; Fri, 17 Jul 2026 04:55:29 -0400
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-81ecf499af9so43773257b3.1
 for <qemu-riscv@nongnu.org>; Fri, 17 Jul 2026 01:55:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784278526; cv=none;
 d=google.com; s=arc-20260327;
 b=R3rHCwjX0KZO5NkPaMEGykBXdmQ+IXlWUBVGcnJ7MC39dTP39sWhPjPaBOvp27fz23
 QfpcmN7y/CkFihx4HHuwUd8jArfMixPDL/2wvGvcUtYcaPiEXEB2LbSzMxUUUYDlvUGj
 YYHn/5nNM/xkLI5k+jJrBCTXASLCKobbXcJBcQWhJQUDSnUmJPkdw37xs+d2Fdlecztf
 MZbzlAjcBfiotxILj7EJOTl0caM25OU70OuQJFN1W87TKNvM+k5b2nIn3+VM6uH4d0O/
 Oi9/u8p4oi8pFpF9aF8mmmWl+WvZchIDguKljYafWcopzDnE7elHcG4HScTG7Q5SrQ3a
 hiZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=qfDpFj5sI7c1lMBs2+vjZfAUb2p+bBhzlM8dFQ160u8=;
 fh=aJr00jAe+lJp5LnH4N5mdANg0ahKSOLFkPhriqIZcwU=;
 b=Dk5onTjeVpThTpfrFVoV/eCrGrSl5uc2+JU4xd4URQDdmcrQ+vT2N82ETcrBifln5u
 1/goV0wfIbb7aps9dONo7qwinuezM9fcjWxKK3nE/xxe/klVMn8GTzpqhrcaihJMyLz6
 5bgKq0m1NV6zUqboedWVg9RvOIroFeHJTSVb87QQJRfoLlKKgeyJ8usxLuf9uENjdTpp
 y3QShIf2s7wRSugVBf3fxLurAG5nZL8w7VY3PD9PzZUUxMiBfiVVpmnVgpbf1MN2l3hX
 6/5fGLimlAcuUQEkfw1tlrP3/PVsDBWEts4f7aoLnQQdE2hhMLulGUZwtIkmdDC0LJlk
 vFAQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1784278526; x=1784883326; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=qfDpFj5sI7c1lMBs2+vjZfAUb2p+bBhzlM8dFQ160u8=;
 b=KoF3yKPQSFaDe/Kt9avpmfj9d79tX7MyBbJlpIIdS4xdGSj9ixIhkOcqJdFMIFMmck
 Qb3kXoUMAWE7D7Do6biMTkNE0d+iNkIneYch2kWbxM3V9CfVa8XlkM3Mv2Wld5/MAdGw
 dwOfK9PfdRVECKody5pbhUlhZ1RecDsBKHaS1eSV65y2nIvQhGTdkeZsYRNgteVfE23W
 pKwsvHwUZuUb29RU108TExmbpOf1g+ABFArL5zwUYCW9W2rfyg2PsZnG3O+COX/zYLd4
 8bHtjMbH1va2YeESeNsz3fr9/Kfafh4NeBiQS/HRJseCUHaJqdcpt5oPM8x301r8bRMQ
 6Vxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784278526; x=1784883326;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=qfDpFj5sI7c1lMBs2+vjZfAUb2p+bBhzlM8dFQ160u8=;
 b=KGg7W/oM1f1ANVMY+kcrH7sxa96YnJejCu3w8eqa5RvKqQJaiCkqkX4d4taYgpaXip
 JPyl4c8ihNe1fVhtazePQ8sp804mWXWKnAM6994ZvzWegTKdTlS21Y+S68G20kJREtdX
 uhstnvzBYBuqSzgYLBz4R3w0eUGwewH20vDXlHf9zAar1tMhf0P/1IkOrk42zX1+FCQ5
 1Rb7TM98BqJek9E6gb8gq/NrLYFfaJV/0uZ3uawY9tCzd61ybiVbJfqO+5SwJ0bbEI4a
 Yzgnc3ZRtbnOpdkIRxi5cACInLC7XeAKodz3XFxx66PY6hpJyM9AgvROhwy/XGJ5e831
 TNzg==
X-Forwarded-Encrypted: i=1;
 AHgh+RplM05WI++WxsKABacUuJR5b2kgQwMM8QzsSAs/oW4xO9rvum6EzHQ7ShHWlauOBdZzzDKR0Mn3X8hA@nongnu.org
X-Gm-Message-State: AOJu0YxjhWQ9lrdIV+kYUsmfc4d5F6FV9V827iYlZrA/aqxcUsj86ym1
 FNmnyb69KdbolsUkXDm4WtRoZJhayCqQxFe2FHjnu6BIZh9dOs2HmnyLNE78h4gckZMl08WSxt5
 h+l7CtLGvs06FOOe6VDuMzmDw0aPcOFAu+4518Ou1tg==
X-Gm-Gg: AfdE7clx5xIOz+zGvzt+d5okeh10zQfEA3qK+E4X6GBDs8LaCGlX/FR82VF8x3Rf1NC
 bhK5Mkn/cLuj8/MEW8CkNHiPlOZn5KeHPL6kuvMpVKgpPkB+2SO9oXd8fdGzuHhUw7UOxcfqdhl
 uNma2d/zrBNKxSnXNGAZbXugInxBKBJ+hgEyTmPVbV5xZFsRSiwrhw5sDi0yvNewqZYlKOHxQzJ
 01zSQPUWRAWfN2Aq0s5hYYlY9lrnNdrGExTwCQrraf8RKQk97uTkK9RofaJ7XT7X9p0c71frEd/
 mj+Mdm36iGziSZjx+uOVZ+lUMqFFAQpjE5NN7O1kUAPBhTITWYDHAveo
X-Received: by 2002:a05:690c:3a0:b0:81e:b981:3eb5 with SMTP id
 00721157ae682-81ef25ae906mr4941747b3.23.1784278525669; Fri, 17 Jul 2026
 01:55:25 -0700 (PDT)
MIME-Version: 1.0
References: <20260715190737.1381701-1-frederic.petrot@univ-grenoble-alpes.fr>
In-Reply-To: <20260715190737.1381701-1-frederic.petrot@univ-grenoble-alpes.fr>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 17 Jul 2026 09:55:14 +0100
X-Gm-Features: AUfX_mzIBdcuIA0_XiDSTG-R6hxX7SXzzbEIjX6Yf0tDT0ixLrWe6e-nujP8a_0
Message-ID: <CAFEAcA9FoE33wE9HqcsmP8Xe=g6-JYCGgGyw8YnaEJs8Z5Kbbw@mail.gmail.com>
Subject: Re: [PATCH 0/3] Correct cbo and lq disassembly
To: frederic.petrot@univ-grenoble-alpes.fr
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, 
 daniel.barboza@oss.qualcomm.com, liwei1518@gmail.com, 
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com, 
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org, 
 julien.thillard@univ-grenoble-alpes.fr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1129.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Wed, 15 Jul 2026 at 20:08, <frederic.petrot@univ-grenoble-alpes.fr> wrot=
e:
>
> From: Fr=C3=A9d=C3=A9ric P=C3=A9trot <frederic.petrot@univ-grenoble-alpes=
.fr>
>
> The CBO instructions were, AFAIU, disassembled erroneously.
> In addition, lq (load-quad, a RV128 instruction) shares the same
> opcode space as the CBOs, which also led to incorrect dasm for that
> instruction (understandable since RV128 is an experimental feature).
> To avoid overlaps, we now require that lq is decoded only if
> rd is not 0, as CBO requires the field corresponding to rd to be zero,
> both in dasm and decodetree.
> The last patch corrects the original indentation that was making
> checkpatch unhappy.

Reminder: please put some disambiguator in the subject lines
of cover letter emails. "Correct cbo and lq disassembly" doesn't
say it's riscv related so you can't tell without looking into
the email body. Doing this assists people in easily scanning
through the list to find or skip over topics.

thanks
-- PMM

