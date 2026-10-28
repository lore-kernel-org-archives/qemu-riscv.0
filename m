Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41EFF606A31A
	for <qemu-riscv@archiver.kernel.org>; Wed, 28 Oct 2026 06:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=Aa+ku050
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xLxH3-0003MK-OW; Wed, 28 Oct 2026 02:36:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jay.chang@sifive.com>)
 id 1xLxGz-0003Ls-OJ
 for qemu-riscv@nongnu.org; Wed, 28 Oct 2026 02:36:34 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jay.chang@sifive.com>)
 id 1xLxGy-0005NZ-24
 for qemu-riscv@nongnu.org; Wed, 28 Oct 2026 02:36:33 -0400
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-6ae305e3bd9so1237775a12.0
 for <qemu-riscv@nongnu.org>; Tue, 27 Oct 2026 23:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1793169390; x=1793774190; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=c+hxXBbSiym1hmLWpsahHoG7iDEd+4O/rtaXuQe6iPI=;
 b=Aa+ku050+Ol3CJrRdaQjnEoqA/LBMSQncfnA8qZHiywVw9XRwkxtAYMsAo8Vfgx7y9
 WidUx8KVj12ewHYv0GdQf7em2zoLSEwc7nGNyE4rKhLA/dz3LUfYiNiyGYm+ahxJCohY
 /pv4vb7kkAZaUV4qY8OSNxtUjIrEVFPcUtB9OISNJFwLVLCyrvyBmOl78pqnteTTesvf
 +gFicxOwvG8xRuDinggvs1fTR6XLFdfCPVE6WbMV6zZmKMcy1bShrkKjmwVtF/cYEcew
 nYPeZYldUxijlIH5iaI2cOlHl2uWrDw3mQRg2EK+r+KhvhvB6aBoi3u5lW7F5iumSkqw
 r4PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793169390; x=1793774190;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=c+hxXBbSiym1hmLWpsahHoG7iDEd+4O/rtaXuQe6iPI=;
 b=idgQgj413AyVM2dP/hTEuUG2LEjd4Znut5ttcip0zlMRq3weA5uTwTq42uvwGi51IW
 gzehvLUc6QEwOp+BGeBNrhIiMTB5FjJTpYMq+Kl2tXXJyKWNChEHuO14zr7+5/sXhBHp
 ElXvfv1XQfzNtRVSqR3F41Gsh/iXsjEX9atRPGAonTbI7+AAHnopamgShxkbDrB9Chn+
 WRFl6KriLOVfvaUyCy9SNBYvFdkGNocK7lAwqNVYtyexPn/GPBx/OTJ9ac/VHSUldfD1
 8urvcZelcNTelEnZycQjFUt/1ASl72LxDRqw4u+V2VCHz2XIWPvdP/lEU/1nIHWHKFJg
 LN+Q==
X-Forwarded-Encrypted: i=1;
 AKwUvBxCvKjkUHHl3xecnQzAkqz8p5VZxstETRFYsfPQuqXQXsjgtcd/cyf8ZaLVZM1AfPWBaqclz9Qd8ABo@nongnu.org
X-Gm-Message-State: AFq9FYI2kiPcXOuGFBQ1pbR5/fppZXivJtVVSbC7nG46lZ08SNzDifud
 3NQA4A25uT6i1Dv0uFlgenyDbbenPb/F7IycIIyCP71mKJiizR+rH8KjqP0J9sSYrwX++LWIHue
 qqbAcy4KBxKLOGpr49MIeDoaWr49hNHS3BysXFLkAueTqLqGeKksYRJUZ6KfyFCl82FwM83pqIx
 iK1bnjCQ5xeK6YxN2yqpJfysahMxwxY+NJnv9gJLaiLGY=
X-Gm-Gg: AYBFou0tR2yHwlAaEDO1AMButf+da1WvFVDmgqGQG3yEWFpO1NESSUCgHlXT7N6A4+2
 IbNYo8rLQlt3wL/r8bwNpnK3CHm0xShRIVSwkq+PSKgGz2sLnopSCtDAo+ktrFH44NQMNe+Unm5
 Wa3YCy9EOjLTLF4JSTg2NLrUETLbhZAecdqPle7UiHofwM+kvLaWX1UnOuVP54P8V8+jVQHpl28
 js60D/1pcnrKSGbd9Jvaank8reEU77WEgovJSG3XZ41Q/LeaPF/vz7EheaOivw2Xzj44X+kFV3I
 HiR/ecskhHo1yn8edDkPgrawur31Kl6svh9FM1U6bRMMXNoo6qQSnSHXfueHBeB2M5gEaF2daTD
 DBaHzzrZ+aEv0I4q6UCiXIATgcmjK1p+MSjmS1FnnojV7Paxtc3lSbTHsgNF1hAjZQDDAXSaWwe
 IeSbJ1ENywatlUbMr9tr2e16HTAuSsXxbh2y32/Gm+Km/2B/pMN0HgJhGjz/zOfXNX5DmSdWxkY
 7Nj8rETUYVVCZfom1jDzVI7UzCTuZxAgVmOh9G8F+dciAMD5JArIaZjoSGbgwxLd74oq1ZivxFV
 neO3TRqumY9Fu/QFKaFAUmOUcrSwODtjFrTJDeIrLXAx1HRJfrM7hu6GHy/Q/S65F3c=
X-Received: by 2002:a05:6402:e87:b0:6b1:ef5a:6719 with SMTP id
 4fb4d7f45d1cf-6b49cb527cemr680815a12.10.1793169390231; 
 Tue, 27 Oct 2026 23:36:30 -0700 (PDT)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com.
 [209.85.218.47]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6b496435babsm1023069a12.28.2026.10.27.23.36.27
 for <qemu-riscv@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Oct 2026 23:36:28 -0700 (PDT)
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-c40e02b2ebaso86915066b.1
 for <qemu-riscv@nongnu.org>; Tue, 27 Oct 2026 23:36:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AKwUvBzdKQrON6TfIAryo6YS7eznRcb77YnqYzcaLMahp23WNWOIn08L5OflsohRoPNhLlMuox4bzXRVif0w@nongnu.org
X-Received: by 2002:a17:907:2d25:b0:c33:923b:ad66 with SMTP id
 a640c23a62f3a-c49bdfdcf78mr100335966b.43.1793169386671; Tue, 27 Oct 2026
 23:36:26 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261021231346.2452179-1-daniel.barboza@oss.qualcomm.com>
 <20261021231346.2452179-15-daniel.barboza@oss.qualcomm.com>
In-Reply-To: <20261021231346.2452179-15-daniel.barboza@oss.qualcomm.com>
From: Jay Chang <jay.chang@sifive.com>
Date: Wed, 28 Oct 2026 14:36:14 +0800
X-Gmail-Original-Message-ID: <CAMXXpfZmyLuHE+h1kMzFOSy2ywmqGHa2LF0Ez4HyayDH-TyQYA@mail.gmail.com>
X-Gm-Features: AclHuK-lhTIQ5AjulPAT5Y0i6U2SfIh1QB5nEWi8f2CqFlNO1ES8lxUOtYVaW7k
Message-ID: <CAMXXpfZmyLuHE+h1kMzFOSy2ywmqGHa2LF0Ez4HyayDH-TyQYA@mail.gmail.com>
Subject: Re: [PATCH v4 14/18] hw/riscv, target/riscv: send resync updiscon
 trace packets
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 chao.liu@processmission.com, antikostya2@gmail.com, 
 Palmer Dabbelt <palmer@dabbelt.com>, frank.chang@sifive.com
Content-Type: multipart/alternative; boundary="000000000000509534065ee0c898"
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

--000000000000509534065ee0c898
Content-Type: text/plain; charset="UTF-8"

>
> +void helper_trace_updiscon(CPURISCVState *env)
> +{
> +    RISCVCPU *cpu = env_archcpu(env);
> +    TraceEncoder *te = TRACE_ENCODER(cpu->trencoder);
> +
> +    te->updiscon_pending = true;
> +    te->trace_next_insn = true;
>
Could we use trencoder_report_updiscon() here instead of setting
updiscon_pending and trace_next_insn directly?

Thanks
Jay Chang

--000000000000509534065ee0c898
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote gmail_quote_container"><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">+void helper_trace_updiscon(CPURIS=
CVState *env)<br>
+{<br>
+=C2=A0 =C2=A0 RISCVCPU *cpu =3D env_archcpu(env);<br>
+=C2=A0 =C2=A0 TraceEncoder *te =3D TRACE_ENCODER(cpu-&gt;trencoder);<br>
+<br>
+=C2=A0 =C2=A0 te-&gt;updiscon_pending =3D true;<br>
+=C2=A0 =C2=A0 te-&gt;trace_next_insn =3D true;<br></blockquote><div><p cla=
ss=3D"gmail-wnfdnt10 gmail-_1ibi0s3fd gmail-_1ibi0s3ce gmail-_1ibi0s3eg" di=
r=3D"auto">Could we use <code>trencoder_report_updiscon()</code> here inste=
ad of setting <code>updiscon_pending</code> and <code>trace_next_insn</code=
> directly?=C2=A0<br><br>Thanks<br>Jay Chang</p></div></div></div>

--000000000000509534065ee0c898--

