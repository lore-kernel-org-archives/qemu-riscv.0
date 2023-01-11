Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pFbzD-000820-Is
	for mharc-qemu-riscv@gnu.org; Wed, 11 Jan 2023 09:21:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stagethalescristal@gmail.com>)
 id 1pFbz6-0007vy-GR
 for qemu-riscv@nongnu.org; Wed, 11 Jan 2023 09:21:44 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stagethalescristal@gmail.com>)
 id 1pFbz4-0006gu-UD
 for qemu-riscv@nongnu.org; Wed, 11 Jan 2023 09:21:44 -0500
Received: by mail-wr1-x434.google.com with SMTP id z5so14124737wrt.6
 for <qemu-riscv@nongnu.org>; Wed, 11 Jan 2023 06:21:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Xw3+noqo8N1Hqvt9v/9YsjOnaDzRchYiAOecLVlt93U=;
 b=Jl8YulGZ5+r0gFPS0o62vrMQeke60cGqHoHNj6CpRelMoIgZb0893ZW2ZXbKT1LMsF
 Mcr5xk8ggA1wjYdnrWJkKWVC+duGNJMcxIl/l+ToBtJ9yRh9swmRO4ThGHejgobz95hB
 PBs1xjnhmXDRI5Q7gYTaok80OpZrkjAxx1xQp/8YFIp3p2kcVQ5UeWQG+j5mVMD2Dbi3
 h9AJJe6xQu6UF2GLoa/+vize3g3kci7K2bBDrDS+tWGVuKtZvmkn3PU45jvv6qCnF5ww
 sliGWpL5hOBWv/K7qxjNF0s29RqdvM1QusWurbv/SkIZrn0hKzYT7osmTLxZ4BqWhshI
 /MLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Xw3+noqo8N1Hqvt9v/9YsjOnaDzRchYiAOecLVlt93U=;
 b=f/gd1Hf4Nu33wNI62HeHW2Tm82aFvHWTFeku9t9ZRDdBVReCel1FPluJ9uB1zC9/2e
 4uB26IPeKdUgxlavXJO5f5SMlpNyU7+w+rK97FFBxaHYGQb1rQrJO4lKOczsLoxy2NvM
 zrKc2ENPE0WdXunPq/ZzimqUB0feNSW7Ux+NSYNsLsYgdialROko5tUZMKyXhD8/eQT1
 og8tHBKY9UEZBKTRm04qUzhjsFByJsv48CJC0hyHYjN7ThsmLHxiiaBsCGyVOkiAOCpb
 n41xBXynAdbi/0dp/BiRNxnq7LaQRtRUMWf8+J7tS8x4ZWSz84gvw1a/Hm0lZvNEBtAC
 /MQA==
X-Gm-Message-State: AFqh2kqwII3k/E2UdxPfeoR7aC+tisKkHLXgwj0P3GWnvIjIdGINcYC7
 AlaY3ZpY0fCziT6zu8h6Cc58HWyB4BPvmSdv/nWjChsD
X-Google-Smtp-Source: AMrXdXuluYi3EUCYYZwv57P/3C20seedFbL+yUpTtVJPPpWf5PrVHxMq7nC9lTePb7PCsllgJ0X6tjHVsho+iD+cX7w=
X-Received: by 2002:adf:fe4e:0:b0:2bd:c394:7b97 with SMTP id
 m14-20020adffe4e000000b002bdc3947b97mr109023wrs.141.1673446897166; Wed, 11
 Jan 2023 06:21:37 -0800 (PST)
MIME-Version: 1.0
From: stage TC <stagethalescristal@gmail.com>
Date: Wed, 11 Jan 2023 15:21:26 +0100
Message-ID: <CAJWvPnt95pOb6-QFxrHMH7NNrtxNHKRLjhVoz5A+BZ2Er-joKQ@mail.gmail.com>
Subject: qemu icicle kit es
To: qemu-riscv@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000db2c1205f1fdb778"
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=stagethalescristal@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Wed, 11 Jan 2023 14:21:44 -0000

--000000000000db2c1205f1fdb778
Content-Type: text/plain; charset="UTF-8"

Hello,
Sorry in advance if this is not the right way to do it but I'm a student
and not very used to this kind of stuff (first mailing list).
I'm trying to run qemu for the Microchip PolarFire SoC Icicle kit but I'm
facing a few issues and the wiki page about that seems obsolete.
I follow almost exactly what the wiki does (except I use a terminal as a
tty instead of the socket bc it didn't work) but my HSS won't boot on
versions more recent than 2020.10 or 0.99.12.
However I can't find any image compatible for versions older than 2020.10
or 0.99.12 (mines hang at "starting kernel ...".
Is there any newer version of the tutorial ? Or does anyone have an idea on
how to deal with this issue and use qemu for newer versions of the HSS ?

Thanks for your help.

--000000000000db2c1205f1fdb778
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello,</div><div>Sorry in advance if this is not the =
right way to do it but I&#39;m a student and not very used to this kind of =
stuff (first mailing list).</div><div>I&#39;m trying to run qemu for the Mi=
crochip PolarFire SoC Icicle kit but I&#39;m facing a few issues and the wi=
ki page about that seems obsolete.</div><div>I follow almost exactly what t=
he wiki does (except I use a terminal as a tty instead of the socket bc it =
didn&#39;t work) but my HSS won&#39;t boot on versions more recent than 202=
0.10 or 0.99.12. <br></div><div>However I can&#39;t find any image compatib=
le for versions older than 2020.10 or 0.99.12 (mines hang at &quot;starting=
 kernel ...&quot;.</div><div>Is there any newer version of the tutorial ? O=
r does anyone have an idea on how to deal with this issue and use qemu for =
newer versions of the HSS ?</div><div><br></div><div>Thanks for your help.<=
br></div></div>

--000000000000db2c1205f1fdb778--

