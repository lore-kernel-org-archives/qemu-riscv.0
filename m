Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86F90606A31B
	for <qemu-riscv@archiver.kernel.org>; Tue, 27 Oct 2026 07:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=nE6zQpcN
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xLbC0-0008Nr-9u; Tue, 27 Oct 2026 03:01:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jay.chang@sifive.com>)
 id 1xLbBz-0008NU-0G
 for qemu-riscv@nongnu.org; Tue, 27 Oct 2026 03:01:55 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jay.chang@sifive.com>)
 id 1xLbBw-0002sF-VI
 for qemu-riscv@nongnu.org; Tue, 27 Oct 2026 03:01:54 -0400
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-6b203527bceso5427134a12.0
 for <qemu-riscv@nongnu.org>; Tue, 27 Oct 2026 00:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1793084511; x=1793689311; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=3VT6hOBkedohLNvvLn5T4101un/pKxQMYOKhYaFkUv4=;
 b=nE6zQpcNirMY/yTkjEDHivIi2nGOqpclduhbTTMp1OFImfK+7XM91cRfQuZE8Djos3
 CLLwKpsPCFX2K/WljxC3pZfubmyBgGwQE/fLkiWTOp6Ums6XAVsDaOc2FFJbTIlD4cGG
 hmbU9t8PFqa8+UJBAVSqm23995ude36hjo3tnJVAb/DA7l/24FS5X1o2qxCd/Eyp5cgL
 y4OIAHd36d0gFOt27yIk9MN/evsGMinGc7kEEVk/Nk5lO8IOKXN2whl0UCpeddazxMJJ
 HE1qVWGqX1/duOItpHS8u2Ly7X7xw6hxWUhTVVy4n1ejLTTmq2rCQoGt1VNmT2Vdygmi
 Y8Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793084511; x=1793689311;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=3VT6hOBkedohLNvvLn5T4101un/pKxQMYOKhYaFkUv4=;
 b=Lm3QMcD0zdvG7p5HsPzAcAFBUj+AVhwo9brSBtwGR7OhcU87EKwBrfdN14EDsLM03r
 Kd8a6NQR6xgNwOlLS43vddm94AWc8C3s8S2hMO5Q6PCDT59Y0Ho1gxSoMS5FQIqVZati
 KjvLqH1C/tsLOhzsfdd8KGdTR6ZYhThYBr6jhLaiWj7tYU4AjUYRT9/j5m0EX/xCM83z
 zaqkGk2dZPeHeXPdUdtRwtbqocZseWaTeSJfbHT3r0irck07jihD6S9osM7YnVhtZ8v7
 PSnrDAy3fZL41a1DO0YKW5Ugw+L/OfXeAAEtr8HugFW5td0GNVceDVnDg72RMLJMVXB8
 HDeA==
X-Forwarded-Encrypted: i=1;
 AKwUvBwK1TmABWnB3ko380YuajPBxuzQbws7AF6nJVfogDhueYoJroz9FMoKirwvU+4QTyzQB92CkgurIOu7@nongnu.org
X-Gm-Message-State: AFq9FYIsaOlSGdU9ZSC91Vc87krdUX9GIdA8AdaURynWD1f4wRCA5TXR
 fc0tOtVR7WCcdghUZYER8jE2QcvLw7nBQbDkMjCqiWiPX0g9fIljL0hDPVkEmqCTGcNHm6D0aWQ
 3mQx93y7yfE233Zx951aCEcrReMQ/C1Ld9js1MlCjlflCFJszYrTQ1vekNjytbDf+8YvkV/IdQM
 WpSJjBR9aBIcLkns++9bA68K/S+2TcAKBKqfwFnkOUhw8=
X-Gm-Gg: AYBFou1WOVUQgJfwIK6FDTSjJ5sir5ooXB3ocjNDsWJzF+pk2c0XvBaHiKOh+QP0XSj
 RyvVbE6i7d1XJrHHEBmbbBZkdwIRRy8pG1oS49XrUF7042Q+LRFy6bg4gzfE9GWPCMcv709SkiH
 0gvR2tJPOH/hwd1GTVXdTHtvzgZqqirWgOH5UGj7xu9Vb+A7CeqOLpxjJXTzgPt/fPMPwQsPLIt
 gPyTXvy3PGHshSGRFfjsmHWWOIA4sbS6cruoIJeVgRsrK+cl6zwILgKSLCtc0z5Kbw2HjHcS4l5
 L20OvBSHSibrHjlyDlnEqqeCQ4lCP7IRHHj6Y3F3liq+vLJEY2j5+weqmUn8nKHtLexTKnjK0YJ
 tNrcgqB5PuKJqlodFsXUUUbvpE+MeN3Aa04bWVkB+SU284xWHBfKKedrCmZEo5N+6w0fn+zorsC
 cbnAe5cTY+nMNOZkIl58eJzvT0psNJLHITEyhxE91MITzXqcb4OjqDiD5vXKZRJdGhzLuynCWxT
 P4la5N0viZs8/D77SYziwoU8Pexey2UH99GsIwbpCRL8yOebtxD5l2fpdCvkXeclBjb2PIAXMGM
 nInjjUx4ekRZOfSbGScNRhMSDvv3rfblg1wBOgVOqN2xS4C0lQ/IaYubsGM4V6KXsFs=
X-Received: by 2002:a05:6402:c4c7:10b0:6ac:7737:e50d with SMTP id
 4fb4d7f45d1cf-6b443002391mr6378623a12.29.1793084510986; 
 Tue, 27 Oct 2026 00:01:50 -0700 (PDT)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com.
 [209.85.208.42]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6b445984b61sm4661923a12.25.2026.10.27.00.01.46
 for <qemu-riscv@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Oct 2026 00:01:49 -0700 (PDT)
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-6b1aa377c61so4920758a12.3
 for <qemu-riscv@nongnu.org>; Tue, 27 Oct 2026 00:01:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AKwUvByUrYJJVHq6NVe9MgqHDoUJEGNIfdRHEAHF5wKczfPd8bu6W8QmRSKbLs+67jDAV95Am2OO/wt367kI@nongnu.org
X-Received: by 2002:a05:6402:4401:b0:6b1:b5ea:2580 with SMTP id
 4fb4d7f45d1cf-6b4431163f4mr9830763a12.44.1793084505754; Tue, 27 Oct 2026
 00:01:45 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261021231346.2452179-1-daniel.barboza@oss.qualcomm.com>
 <20261021231346.2452179-11-daniel.barboza@oss.qualcomm.com>
In-Reply-To: <20261021231346.2452179-11-daniel.barboza@oss.qualcomm.com>
From: Jay Chang <jay.chang@sifive.com>
Date: Tue, 27 Oct 2026 15:01:34 +0800
X-Gmail-Original-Message-ID: <CAMXXpfaX=qx6+YBY14xmCFN9zHpDiCmZEDjK1PSw-HaN4nCQHA@mail.gmail.com>
X-Gm-Features: AclHuK9JgeXVgSefLsjo1LZENULMXqmkNHH9GY8FlNiqBk_OmL7LDmVbbv5GBqY
Message-ID: <CAMXXpfaX=qx6+YBY14xmCFN9zHpDiCmZEDjK1PSw-HaN4nCQHA@mail.gmail.com>
Subject: Re: [PATCH v4 10/18] hw/riscv/rv-trace-messages.c: add encoded trap
 message
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 chao.liu@processmission.com, antikostya2@gmail.com, 
 Palmer Dabbelt <palmer@dabbelt.com>, frank.chang@sifive.com
Content-Type: multipart/alternative; boundary="0000000000000494fd065ecd05a1"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=jay.chang@sifive.com; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--0000000000000494fd065ecd05a1
Content-Type: text/plain; charset="UTF-8"

> +    payload.tvalLow = extract64(trap_addr, 0, 32);
> +    payload.tvalHigh = extract64(trap_addr, 32, 32)
>
For synchronous exceptions, these fields should contain the trap value (tval),
but both are currently extracted from trap_addr

Thanks
Jay Chang

--0000000000000494fd065ecd05a1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><div class=3D"gmail_quote gmail=
_quote_container"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">+=C2=A0=
 =C2=A0 payload.tvalLow =3D extract64(trap_addr, 0, 32);<br>
+=C2=A0 =C2=A0 payload.tvalHigh =3D extract64(trap_addr, 32, 32)<br></block=
quote><div><p class=3D"gmail-wnfdnt10 gmail-_1ibi0s3fd gmail-_1ibi0s3ce gma=
il-_1ibi0s3eg" dir=3D"auto">For synchronous exceptions, these fields should=
 contain the trap value (<code>tval</code>), but both are currently extract=
ed from <code>trap_addr</code></p><p class=3D"gmail-wnfdnt10 gmail-_1ibi0s3=
fd gmail-_1ibi0s3ce gmail-_1ibi0s3eg">Thanks<br>Jay Chang</p></div><div>=C2=
=A0</div></div></div>

--0000000000000494fd065ecd05a1--

