Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF82C606A31A
	for <qemu-riscv@archiver.kernel.org>; Wed, 28 Oct 2026 07:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=i77HvmYS
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xLxpF-0001vc-35; Wed, 28 Oct 2026 03:11:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jay.chang@sifive.com>)
 id 1xLxpE-0001vC-3f
 for qemu-riscv@nongnu.org; Wed, 28 Oct 2026 03:11:56 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jay.chang@sifive.com>)
 id 1xLxpB-00014b-V9
 for qemu-riscv@nongnu.org; Wed, 28 Oct 2026 03:11:55 -0400
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-c315869241fso92336166b.0
 for <qemu-riscv@nongnu.org>; Wed, 28 Oct 2026 00:11:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1793171512; x=1793776312; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=C3pAyL/TfLRDhodU+4wK7XbefuydGvYrayvqso5pxvk=;
 b=i77HvmYSDEkeAL34t/jCN0qcse4afvKx8ey3CflZxCCnmIuAXenmPRCA5e/7tQ59qU
 gQo3dGlHz7aEZ0rvm5dpFizulpyawxI+FKfb5SzCYH08Zque9ODEleTrZ5vu7dKw6A40
 byhMUKVQsnVu1IRR1SDfz3kUyawPBL4720UTeAsWVb9vSI1NIjdiPmB6G57fcrQKVH4e
 dB1QrBYJdilR7XF8EOR7idXJWQYLRKKK6T3eIi4ZqX9eeQvWhPlIG+mljHmIxyhDFo5g
 oFeIIVGjCkbi1OymMwij2/fCF0zIq7SHoWsiNG1lE8vHW216j6nsKVfca2VQOOs8CJkb
 cnkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793171512; x=1793776312;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=C3pAyL/TfLRDhodU+4wK7XbefuydGvYrayvqso5pxvk=;
 b=DOUs6FI9V5GF/IfZ+JzjKMDkCI0p2Xq2gNc2XOv3PxpO+GauHrtqCfXfuOgRp8AJhH
 geyhY9VYH0Qf6IWwoi6IEZFc7BRu8FDrHs77e78vD7L4K3gbveQSGVri91IFwexXvF0X
 DB+BeT+xZ1l7Aou1c8PILut7Ye9YzE5xaaM3l8f+ZfZPZSgs5fBgqBss7dEorshvUuqT
 qCBv28kYNa369eMzC7eZUtfUvamgt6iMsT0Ia4IQoeMDUaYJ9YgQAPTbxQ7eaSsRzPOe
 iak4wLeWQ80nYN0StsQdn0A0Y4+V4PFstbJ7Mul4HU6bUSj9HBLU8LKHJwCZLVXR+hS/
 uttQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBzA3D6eVfdzPvPcOVNTJG4Oeabos6mIsuq/O7Qfiz1u5p/GaVRAxHe8Ay/c9zkEfp4S9da7fbFUv+Nh@nongnu.org
X-Gm-Message-State: AFq9FYJlIOvlZ0JuuOf4TkNbJlfNlimVZOm4zs3fPZmetJ9myETulraq
 JKBdMBc8A9wTp41qV286jpwBqRjrrr/qp/mbBwih3Tj84Ld3FUSdHL1H28tAjF7GxTNbmjEAgnO
 +EqEEk1JENOWHG/BRhCAWKR6EHujcpgnrqYAHNxZL2bbFayAlkx3G4Ymbu28DMqkYx0UmvvCX6s
 Mcq+C5QIiZ9wcnajd4Wk2oU3vsI2/WzKs1cWMIs0yxAPU=
X-Gm-Gg: AYBFou3jhew1a+mZEUGCs6U5mBpvqdPAVlL8oaZfa2xetNUoXF6DEKhnOwsoak9FkjL
 xxAl+emys4FPCK392Q1mUSzlwc86xf9AtQmLug5/dxEKorx7nFMwpX//El9ZXbfBbFzuut61UBT
 gLOa9hDjxAw3cLsp5MJ+BBXSxuyYY040VDoU5Wm+1GLaOhoDLc2+E2LkwIe2OE/tZEOBRLZp4da
 30X9N0fRzWl6Y4FKPzs3rJfwegV7gcrFWr8nWF0pmpvZHE4xlBdOUqMiyMNTaYeasSkwX+LSWq3
 iju8f3XfE37VRJ4ipTBIWrbih6XC4/xzTxmlWTGaH7Pwu618pxe2nuX8hU8QToXPpMBe/n/RV4F
 NRQ3UBXuFElBscQl7yGeExQIbaA/OHVdOPS87MOtwXaa7clRxjN6pnb2mhIvP3aMkqHFLKDNsZ4
 2vxvDjvtMxhajR/H330vcoFzmVPeYFsvAhb8l91yYOvUfe1oqWKpigbZKJZMRzIPypxM6L/y6cE
 GbtZfJG0h0g5JIDNGReDwTEQMNH+CwYigiVQyByFBF7dzgiasVeXqLzLcR1F0nAJjVoASHKRQ0M
 Y1VA/aEgxUf8GAS1tsAU3bn0UV2I/3QkYEaEgACc+I5J65qk9UQNDIPRqjTG0eLDl6I=
X-Received: by 2002:a17:907:d48c:b0:c3f:7e8:235d with SMTP id
 a640c23a62f3a-c49bdda7ab7mr128798066b.5.1793171511938; 
 Wed, 28 Oct 2026 00:11:51 -0700 (PDT)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com.
 [209.85.208.49]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c46bd4ea0ccsm568400066b.16.2026.10.28.00.11.50
 for <qemu-riscv@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Oct 2026 00:11:50 -0700 (PDT)
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-6b408f2d936so1006380a12.1
 for <qemu-riscv@nongnu.org>; Wed, 28 Oct 2026 00:11:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AKwUvBxdOccYary9hzHFbqkwV3ZglVbTJbHPviuEc/wecBm6niYIdKrZVqY+Ikbg7CA0tGsO+W5gk4CpGfsA@nongnu.org
X-Received: by 2002:a05:6402:144:b0:6ac:b3e7:2357 with SMTP id
 4fb4d7f45d1cf-6b49cbecc82mr563014a12.21.1793171510001; Wed, 28 Oct 2026
 00:11:50 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261021231346.2452179-1-daniel.barboza@oss.qualcomm.com>
 <20261021231346.2452179-17-daniel.barboza@oss.qualcomm.com>
In-Reply-To: <20261021231346.2452179-17-daniel.barboza@oss.qualcomm.com>
From: Jay Chang <jay.chang@sifive.com>
Date: Wed, 28 Oct 2026 15:11:38 +0800
X-Gmail-Original-Message-ID: <CAMXXpfb0arbbqenw5eOHhPrFZ6P5xkN39zkj7JzdUs5kg8oz-g@mail.gmail.com>
X-Gm-Features: AclHuK8Z_IGGX3zmPD92I6x-p2WwSofuPP_-Rw-79QQTdNjSxAxbsKM0_GbapC0
Message-ID: <CAMXXpfb0arbbqenw5eOHhPrFZ6P5xkN39zkj7JzdUs5kg8oz-g@mail.gmail.com>
Subject: Re: [PATCH v4 16/18] hw/riscv/trace-encoder: send branches info
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 chao.liu@processmission.com, antikostya2@gmail.com, 
 Palmer Dabbelt <palmer@dabbelt.com>, frank.chang@sifive.com
Content-Type: multipart/alternative; boundary="000000000000e00845065ee146f8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=jay.chang@sifive.com; helo=mail-ej1-x62f.google.com
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

--000000000000e00845065ee146f8
Content-Type: text/plain; charset="UTF-8"

>
> +void trencoder_report_branch(Object *trencoder_obj, uint64_t pc, bool
> taken)
> +{
> +    TraceEncoder *te = TRACE_ENCODER(trencoder_obj);
> +
> +    /*
> +     * Note: the e-trace spec determines the value '1' for a
> +     * branch *not* taken. The helper API is using taken = 1
> +     * to be more intuitive when reading TCG code.
> +     */
> +    if (!taken) {
> +        te->branch_map = deposit32(te->branch_map, te->branches, 1, 1);
> +    }
> +
> +    te->last_branch_pc = pc;
> +    te->branches++;
> +
> +    if (te->branches == TRACE_MAX_BRANCHES) {
> +        trencoder_send_branch_map(trencoder_obj);
> +        te->branches = 0;
>
Should we clear branch_map after sending the packet, or explicitly write
0 for taken branches using deposit32(te->branch_map, te->branches, 1, 0)?

Thanks
Jay Chang

--000000000000e00845065ee146f8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote gmail_quote_container"><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">+void trencoder_report_branch(Obje=
ct *trencoder_obj, uint64_t pc, bool taken)<br>
+{<br>
+=C2=A0 =C2=A0 TraceEncoder *te =3D TRACE_ENCODER(trencoder_obj);<br>
+<br>
+=C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0* Note: the e-trace spec determines the value &#39;1&#=
39; for a<br>
+=C2=A0 =C2=A0 =C2=A0* branch *not* taken. The helper API is using taken =
=3D 1<br>
+=C2=A0 =C2=A0 =C2=A0* to be more intuitive when reading TCG code.<br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 if (!taken) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 te-&gt;branch_map =3D deposit32(te-&gt;branch_=
map, te-&gt;branches, 1, 1);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 te-&gt;last_branch_pc =3D pc;<br>
+=C2=A0 =C2=A0 te-&gt;branches++;<br>
+<br>
+=C2=A0 =C2=A0 if (te-&gt;branches =3D=3D TRACE_MAX_BRANCHES) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 trencoder_send_branch_map(trencoder_obj);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 te-&gt;branches =3D 0;<br></blockquote><div>Sh=
ould we clear branch_map after sending the packet, or explicitly write<br>0=
 for taken branches using deposit32(te-&gt;branch_map, te-&gt;branches, 1, =
0)?<br><br></div><div>Thanks<br>Jay Chang</div></div></div>

--000000000000e00845065ee146f8--

