Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oMRwm-0006oG-RT
	for mharc-qemu-riscv@gnu.org; Fri, 12 Aug 2022 06:31:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oMRwd-0006m1-WA
 for qemu-riscv@nongnu.org; Fri, 12 Aug 2022 06:31:12 -0400
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135]:34391)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oMRwa-0007F7-OL
 for qemu-riscv@nongnu.org; Fri, 12 Aug 2022 06:31:11 -0400
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-31f443e276fso6024297b3.1
 for <qemu-riscv@nongnu.org>; Fri, 12 Aug 2022 03:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=/PZz8U1wt2t9LyrYY9eWAnlUGlm7HC1lkA2XWsS9g3s=;
 b=razmEO2wGp6IpnOsJ4GgLYlvFOOVvyDghrnq4wDjSV6yqwup2EX4wnPMaKxNOkHJPj
 tD+WK+JSNp0dldg3PHpm2U8/dwDZKS7ApQJGs0yAJyhI97pa4+Nfvc7SUPyFCrN/+q/7
 z4myMa1PP/D0Aeyzt5yh6c7GBIdCIwn7+/ErjC7z0Jr1jExQ26SnBThJHXJs3Q/rDl8K
 NJR3d/r+/IEP8UfSMACljr94p/HNTzQrgFmBj8KNQxi3ASBDkehvatAigu+0wO7DP2sf
 D4V4+hS88j2+axvL5eIgBe7aaJpNwquphcbQPHUXq3lI3cDypXNBOOHVWzRShi16spfq
 9MWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=/PZz8U1wt2t9LyrYY9eWAnlUGlm7HC1lkA2XWsS9g3s=;
 b=SEwm+iXSCBE+3eCuPO4IuWy6D25nYX7ljJDsqtklxI1AWVtHcyTY7ta+3RGlY1dlQr
 l/mEIa7jrtqZYVsvwjnuV/M9TGCsOvZNhIfrWVyGECRU45AhtC31/EUWIhH+mJx/l1NB
 TBvwvYmiZZ2Cx+7GQKfoyLXFq0wiq9xSsBE/2433OUgSWgxTRkRQMQDCaFXAA8JtagA/
 ia5zvoard2tHrKHpNObFWuDoviBkmThhgqiCTL1Q+aEoVSAJj5d1v7DSNx5StsW5mwjS
 nGToxp9/w7R5Pb0Zk90s7Tc6Jvs9AYcrZaC7YxtsZBM3zIMsP6QiWvNfL20E5h+dtPbs
 jvJg==
X-Gm-Message-State: ACgBeo2GBhGuo6sGAbCDK2BtUUedtGqPmlMFmPtfrgSP7kAinauVb0kW
 v9Xlm2GaK9aFUkxaFsMalDu7qHDta5Ing+igfY+XJQ==
X-Google-Smtp-Source: AA6agR5LI1LaT8YXZ6hi+tLVMykpChNaQHszJzuGTk3J8VKqaFkepbr4zigFewMfDbkNUNRExQWJJ3DMLbXGcBYxl7Q=
X-Received: by 2002:a0d:fd05:0:b0:329:3836:53ac with SMTP id
 n5-20020a0dfd05000000b00329383653acmr3294063ywf.455.1660300267482; Fri, 12
 Aug 2022 03:31:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220809185639.750345-1-qemu@ben.fluff.org>
In-Reply-To: <20220809185639.750345-1-qemu@ben.fluff.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 12 Aug 2022 11:30:56 +0100
Message-ID: <CAFEAcA-yFBJOTRrVdCM+YESKxmsPHGJA58mjcREt4erRKv=3vQ@mail.gmail.com>
Subject: Re: add qemu_fdt_setprop_strings() and use it in most places
To: Ben Dooks <qemu@ben.fluff.org>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, Alistair.Francis@wdc.com, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1135.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 12 Aug 2022 10:31:12 -0000

On Tue, 9 Aug 2022 at 19:57, Ben Dooks <qemu@ben.fluff.org> wrote:
>
> Add a helper for qemu_fdt_setprop_strings() to take a set of strings
> to put into a device-tree, which removes several open-coded methods
> such as setting an char arr[] = {..} or setting char val[] = "str\0str2";
>
> This is for hw/arm, hw/mips and hw/riscv as well as a couple of cores. It
> is not fully tested over all of those, I may not have caught all places
> this is to be replaced.

Hi; just as a minor process thing for next time you send a
patchset: the usual convention is that the 'cover letter'
email has a subject starting with a tag like "[PATCH v4 0/6]".
This makes it easier to pick the cover letter out when eyeballing
a set of subject lines, and also helps some of the automated
tooling (eg I think this is why https://patchew.org/QEMU/ didn't
notice this series). Usually 'git format-patch --cover-letter'
will get this right automatically for you.

thanks
-- PMM

