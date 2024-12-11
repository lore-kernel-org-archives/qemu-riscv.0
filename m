Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FF1DE7717D
	for <qemu-riscv@archiver.kernel.org>; Wed, 11 Dec 2024 06:04:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tLFpY-0006uv-KZ; Wed, 11 Dec 2024 01:04:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fea.wang@sifive.com>)
 id 1tLFpX-0006uc-Ay
 for qemu-riscv@nongnu.org; Wed, 11 Dec 2024 01:04:15 -0500
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <fea.wang@sifive.com>)
 id 1tLFpV-00057l-Jq
 for qemu-riscv@nongnu.org; Wed, 11 Dec 2024 01:04:15 -0500
Received: by mail-pg1-x531.google.com with SMTP id
 41be03b00d2f7-7fd45005a09so2248648a12.2
 for <qemu-riscv@nongnu.org>; Tue, 10 Dec 2024 22:04:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1733897051; x=1734501851; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=too7R5d5Rjrj3yG4d82pn3b74IR7gm0FJCZ2xM/7jGo=;
 b=kDq0DUwBCe91B6V9X+YWmqsjslEbU9ok9hcbervDbdAk+W5edm4AMy512ZGpisxzJx
 cBxaXOfDEGNrbEaK89p0GFnk3NPZ4m/8QlkdRNBCk+GC4+wQL60F9gabC08ef1iQHtUE
 IKpmA/zopo4kaGmLSeZALLlb9bKAX+u12DDS8rLo+ZIZpNjxh0SPTye+3ezFFsnTCRIH
 cCDf4MK+J12zwmexcmGcaK+wKeOipLBJmFoaKPna7e080/jthqtPvx6y1weoflWpR+/7
 yh7sXhCe8xhoSQrYaUhNxdaxkVi411BukUcnSBHKdDeNi/ArFTQOYBae9m22fV7H3wob
 B/pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733897051; x=1734501851;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=too7R5d5Rjrj3yG4d82pn3b74IR7gm0FJCZ2xM/7jGo=;
 b=q9cmvSBfJQE88X7HrFUpF1SIB5vjCxuPiZiwKuR3jCvLnc0xUVYja84/dC27TQo5ci
 zq9Ih8HsJ9gaWmxOkA/9Y+58OQigz+R+QHWAiOFCgiHZ+bm0XqylXu2z1KbtUIQHSS5b
 QFruIx/7rSrZ41sk/Ouzy3r3PBDqYGzLySb37NLqZn/JEbcynjD1Y1G6QD5kXqHW3lGe
 GyyMMTDTYETSrD22Ze1s2uZHtnWCKCYnqxQ258l3hwRlmWYnGcuG/yYqpo1UyGM6tE/l
 KXrbbWs2N1FQltsrUExy5UsZ+KNDY0N0wKfG+W9to1pyRr8So989lVHTedtMPnlvUfdj
 7o3w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUkB+6JOCEUTF4NBfVhsuI4Vlcw3vkpipCOhBvyBzYZtJv4b/p7yDyG+IAnnlMTzs86dvxDaRnaeeWW@nongnu.org
X-Gm-Message-State: AOJu0YyFJwgWfL1AI05Gi/y40T/YDfZmOuwu3A+2Da9KtVENFWir+C/u
 LkL6OjG07HQAnXoHV4nyYD5x+XNK6BzIqF7icwBhmpetsK56WvMgfnDdNZTfn6fl0Sx+ni8OnK4
 T3Am9PZuL3Do8brJC/v1zTKDpftN2O9W6qc1a0A==
X-Gm-Gg: ASbGncu8GjOGTX0gHt6BN4jgl+gQBKdQKaeotKLghtTK3Yd5YC1DXhvReclnXtMFIBQ
 X6nJRsfl27b5b7QgnmEub5MhRd9V6Yazd+lw=
X-Google-Smtp-Source: AGHT+IEE2LJJE3P5vAHdr7uFl+FQQeGaW81KXtGP1MrAF0R6My0CGltb2aLUhgXnGNNfWfQHpwHbuIonDpxiAHTk2A4=
X-Received: by 2002:a17:90b:5110:b0:2ee:ab29:1a63 with SMTP id
 98e67ed59e1d1-2f127f8e7afmr2695817a91.3.1733897050986; Tue, 10 Dec 2024
 22:04:10 -0800 (PST)
MIME-Version: 1.0
References: <20241115014702.1663274-1-fea.wang@sifive.com>
In-Reply-To: <20241115014702.1663274-1-fea.wang@sifive.com>
From: Fea Wang <fea.wang@sifive.com>
Date: Wed, 11 Dec 2024 14:03:59 +0800
Message-ID: <CAKhCfscy_dq_d0+RqzdLvX5wcb56T8d7qnOLO1LeCr_33BOAfg@mail.gmail.com>
Subject: Re: [PATCH 1/1] hw/net: Support Marvell 88E1111 phy driver
To: qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, 
 Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>, 
 "open list:Xilinx Zynq" <qemu-arm@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000cd3f0c0628f85d92"
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=fea.wang@sifive.com; helo=mail-pg1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

--000000000000cd3f0c0628f85d92
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ping

On Fri, Nov 15, 2024 at 9:44=E2=80=AFAM Fea.Wang <fea.wang@sifive.com> wrot=
e:

> When the ethernet PHY's compatible string is 'ethernet-phy-id0141.0cc2',
> it will be matched with the Marvell driver in Linux instead of the
> generic driver. They differ from reading the PHY register17.11 bit which
> is for 'Speed and Duplex Resolved' and the value 0 will clear
> phydev->link and stop the flow. To avoid getting stuck, change the
> constant return value in QEMU for the bit to 1 to keep the driver going.
>
> Signed-off-by: Fea.Wang <fea.wang@sifive.com>
> ---
>  hw/net/xilinx_axienet.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/net/xilinx_axienet.c b/hw/net/xilinx_axienet.c
> index faf27947b0..ee4b3afe9c 100644
> --- a/hw/net/xilinx_axienet.c
> +++ b/hw/net/xilinx_axienet.c
> @@ -102,7 +102,7 @@ static unsigned int tdk_read(struct PHY *phy, unsigne=
d
> int req)
>              break;
>          case 17:
>              /* Marvell PHY on many xilinx boards.  */
> -            r =3D 0x8000; /* 1000Mb  */
> +            r =3D 0x8800; /* 1000Mb  */
>              break;
>          case 18:
>              {
> --
> 2.34.1
>
>

--000000000000cd3f0c0628f85d92
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span style=3D"color:rgb(0,0,0);font-family:&quot;Times Ne=
w Roman&quot;;font-size:medium">Ping</span></div><br><div class=3D"gmail_qu=
ote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, No=
v 15, 2024 at 9:44=E2=80=AFAM Fea.Wang &lt;<a href=3D"mailto:fea.wang@sifiv=
e.com">fea.wang@sifive.com</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">When the ethernet PHY&#39;s compatible string is =
&#39;ethernet-phy-id0141.0cc2&#39;,<br>
it will be matched with the Marvell driver in Linux instead of the<br>
generic driver. They differ from reading the PHY register17.11 bit which<br=
>
is for &#39;Speed and Duplex Resolved&#39; and the value 0 will clear<br>
phydev-&gt;link and stop the flow. To avoid getting stuck, change the<br>
constant return value in QEMU for the bit to 1 to keep the driver going.<br=
>
<br>
Signed-off-by: Fea.Wang &lt;<a href=3D"mailto:fea.wang@sifive.com" target=
=3D"_blank">fea.wang@sifive.com</a>&gt;<br>
---<br>
=C2=A0hw/net/xilinx_axienet.c | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/hw/net/xilinx_axienet.c b/hw/net/xilinx_axienet.c<br>
index faf27947b0..ee4b3afe9c 100644<br>
--- a/hw/net/xilinx_axienet.c<br>
+++ b/hw/net/xilinx_axienet.c<br>
@@ -102,7 +102,7 @@ static unsigned int tdk_read(struct PHY *phy, unsigned =
int req)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case 17:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Marvell PHY on many xili=
nx boards.=C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D 0x8000; /* 1000Mb=C2=A0 */=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D 0x8800; /* 1000Mb=C2=A0 */=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case 18:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-- <br>
2.34.1<br>
<br>
</blockquote></div>

--000000000000cd3f0c0628f85d92--

