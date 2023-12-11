Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5F74C4332F
	for <qemu-riscv@archiver.kernel.org>; Mon, 11 Dec 2023 21:57:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rCoHd-0002DQ-9L; Mon, 11 Dec 2023 16:57:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1rCoHb-0002Cg-Ah
 for qemu-riscv@nongnu.org; Mon, 11 Dec 2023 16:57:47 -0500
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1rCoHV-0003fq-A5
 for qemu-riscv@nongnu.org; Mon, 11 Dec 2023 16:57:47 -0500
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-50dfac6c0beso2184127e87.2
 for <qemu-riscv@nongnu.org>; Mon, 11 Dec 2023 13:57:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20230601.gappssmtp.com; s=20230601; t=1702331859; x=1702936659;
 darn=nongnu.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=UKPVikaa2BLezfE8Nh/92umz0KQtEqI+41mcl4l0ePw=;
 b=ewDeVlty+NacT5KASby9VXFQzjrugXfFt1BNCs+irXsTr/7cg8+zsd/uiEVDHUrnQF
 LMxSjza+p3PblaRyvh4sf0B18iGACQRq2vK7xCvJ8EQC+i/CdUofv/7lhZyV9ezItVEn
 oEjp4uQiPuT/hcompbxbXPSpbyYdFYLLuDKfH3Dzo5+6aIOZtNXxZeWBwMbj09y6Hbc4
 QoEyClt3CIetZyBQfuEbOwWQoONNVKuAYILc2Zg36nOXFe61bfV+Cqjrt9f+bd3fRogx
 vqMOoGu4twmm7lW4SaYfiY6Pntvv7ubtja4h4uq2wMOTmPyuctR4BA//pNPL9P7snKWd
 GWqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702331859; x=1702936659;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UKPVikaa2BLezfE8Nh/92umz0KQtEqI+41mcl4l0ePw=;
 b=qvZ7HngmfYXyn8dqyeCwV8HA9rNnS+SiyeqMBU85LnHCM5zWyTZrFslTjU/eFlcJ5m
 czRy/kKwix7JUgnCkUm3QYdtDQb5S2PvRmAR/y0AECW5WEh50yafdzwmBqnr7n16/ZeP
 o9NIgHBoDviu18uCpGy5vCHA/X+0UoFSfLrwe7WR+1ZDMjLTUsFwsBFdiQsudxtO6gGY
 o45c05OKBhm/zm38NU3vkhHLuU/uQ/X4aKRpG21S1xRxhlr01/+VEWzQ4bNXw9WLVPGy
 1C1lK8rOBbwyNtTXxM4M9JChjPu9cNA5CojV+tBhuYO7l/Ok5/idZJNo+j+rWMRyyrV3
 eIPw==
X-Gm-Message-State: AOJu0YytU8d+66bXZ+tMybUB4F3v5OLL3CLC8FN/YHi/Cuoq5JlRXTSe
 j5EYsm1EsFTyljCSfrEicipgbrMI7jeo1z0sKKzi6A==
X-Google-Smtp-Source: AGHT+IG2qMuzvVV1CtWvhYnE38e244SwEqL/xcTix+Kr15BR7ZuKHiaqT3xa9LzluUeec4JTOBB8iJLUsObH0AmIbdY=
X-Received: by 2002:a05:6512:3a92:b0:50c:de34:da09 with SMTP id
 q18-20020a0565123a9200b0050cde34da09mr3009336lfu.101.1702331859299; Mon, 11
 Dec 2023 13:57:39 -0800 (PST)
MIME-Version: 1.0
References: <20231211212003.21686-1-philmd@linaro.org>
 <20231211212003.21686-15-philmd@linaro.org>
In-Reply-To: <20231211212003.21686-15-philmd@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Mon, 11 Dec 2023 14:57:28 -0700
Message-ID: <CANCZdfoHViOt9-wnZ_HxHpKm2r2A_RH90MVjMF3tGjRvnjTd-w@mail.gmail.com>
Subject: Re: [PATCH 14/24] gdbstub: Include missing 'hw/core/cpu.h' header
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>,
 Peter Xu <peterx@redhat.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Peter Maydell <peter.maydell@linaro.org>, 
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-arm@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 qemu-riscv@nongnu.org, David Hildenbrand <david@redhat.com>, 
 Claudio Fontana <cfontana@suse.de>, Brian Cain <bcain@quicinc.com>, 
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Thomas Huth <thuth@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000c3897e060c430573"
Received-SPF: none client-ip=2a00:1450:4864:20::130;
 envelope-from=wlosh@bsdimp.com; helo=mail-lf1-x130.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

--000000000000c3897e060c430573
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 11, 2023 at 2:22=E2=80=AFPM Philippe Mathieu-Daud=C3=A9 <philmd=
@linaro.org>
wrote:

> Functions such gdb_get_cpu_pid() dereference CPUState so
> require the structure declaration from "hw/core/cpu.h":
>
>   static uint32_t gdb_get_cpu_pid(CPUState *cpu)
>   {
>     ...
>     return cpu->cluster_index + 1;
>   }
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  gdbstub/gdbstub.c | 1 +
>  1 file changed, 1 insertion(+)
>

Reviewed-by: Warner Losh <imp@bsdimp.com>

--000000000000c3897e060c430573
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Dec 11, 2023 at 2:22=E2=80=AF=
PM Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@linaro.org">phi=
lmd@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">Functions such gdb_get_cpu_pid() dereference CPUState so<br>
require the structure declaration from &quot;hw/core/cpu.h&quot;:<br>
<br>
=C2=A0 static uint32_t gdb_get_cpu_pid(CPUState *cpu)<br>
=C2=A0 {<br>
=C2=A0 =C2=A0 ...<br>
=C2=A0 =C2=A0 return cpu-&gt;cluster_index + 1;<br>
=C2=A0 }<br>
<br>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@lin=
aro.org" target=3D"_blank">philmd@linaro.org</a>&gt;<br>
---<br>
=C2=A0gdbstub/gdbstub.c | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br></blockquote><div><br></div><div>Re=
viewed-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com">imp@bsdimp.com=
</a>&gt;</div><div>=C2=A0</div></div></div>

--000000000000c3897e060c430573--

