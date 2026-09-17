Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80CEEC982CC
	for <qemu-riscv@archiver.kernel.org>; Thu, 17 Sep 2026 01:02:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x70Va-0005E4-6P; Wed, 16 Sep 2026 21:01:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1x70V2-0005CQ-62
 for qemu-riscv@nongnu.org; Wed, 16 Sep 2026 21:01:16 -0400
Received: from mail-ed2-x10.google.com ([2a00:1450:4864:33::10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1x70Uy-0002oH-QV
 for qemu-riscv@nongnu.org; Wed, 16 Sep 2026 21:01:15 -0400
Received: by mail-ed2-x10.google.com with SMTP id
 4fb4d7f45d1cf-6a803458ba0so493746a12.0
 for <qemu-riscv@nongnu.org>; Wed, 16 Sep 2026 18:01:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789606870; cv=none;
 d=google.com; s=arc-20260327;
 b=IitjU6XF4uiC0bK21HlFi+Syb2GKowQUJ/UhwLZ6DoXLNAKzhx0289gAAiPOlX2jW6
 TgsVEKB5SZ5zZuJk657IcpS400SK0U/fNvbFp22u42rjY7MI0fuFxkASA0Dzz/KcdxTD
 +pDLvVKRrBfLRgKkOckiH5SR1kd7cDPb4SilGRjP/KR+dNcajqmUOoQEPi0Pbi8xfQNT
 oWINuoPb5A+hk2TISD4JYZyYdiTos78QDFPl1ailQWGxfGmUswhkvcxqJcxB5mgEkTkh
 HA8QI2NGT+PzRfTmLNhUggv5rAvclo9dLYyHyjqdUsrW7PsLSjRNaBDJHemjhWVbWC6o
 hGSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:reply-to:in-reply-to:references
 :mime-version:dkim-signature;
 bh=7TdRIIc93N967XDBumgh+AeyDXEC5b/XjEDz2SJJ0CU=;
 fh=aHEVtDNUgcvBCOO/YIEanAh2hYji4MPpcLpqWH6tQcs=;
 b=dFMBpeih1gM3MN+r35aF+ky5b+j1XoH6saLtk1ljnHG4wZa++waE2Az7zQXsCb9Fvd
 iBkPnA0LXOxs3vZt6Tn+vI/OSvjOZ5zTC2wXc4GOPU1rftrwhWt+ylp+Hg2R07CrNDkk
 XQDEqD7W/0cczldrosIUsYJJf3W9iEgikDs2R2vkBB029Os+WQ0rWAD+CXRn16Im6sFN
 pF5J3yKvSraiDNYFEJ8k5FCzMHL7/2HJcydn70J2E4fCo3yjwUx8VM5wTb+dEiGi5vDI
 FpJvtXOxJzNHjooW73bWKAmPxFbpsOoo9X9kly4Xt8AhyAm1eZDDWw41uiH8Sudfupkv
 dSQQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1789606870; x=1790211670; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:reply-to
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=7TdRIIc93N967XDBumgh+AeyDXEC5b/XjEDz2SJJ0CU=;
 b=Jww7RSVuiX5WyNOPy/Rlhc7d4z0+SXYTOMQaoaUjViGIlZerk5osKsi1iAIT162OaQ
 6regAc9OC9bDewuA10ZJfkNj9a/pV0dC6gis8rVQxwRjxDqapBK46lK4+kTo4jjRHRMX
 D6D34AFAoDfiG7HlM9Z/hLJOZ9hI/9BvK+y4uRiWLVXFtFpHHgSu7iilLqubWMONWaJY
 vcjPlqTm0O0BSPxZzah94eCGuWeOElyrJO2yWS5xqYChBeKk2JLzX19yi4BUvsh1RVQZ
 DN8fJN1w54qYzn7eXa25nZl32OJRJTqelJXnScV1e9zp2MH/x259KAWyk1z3+brOvePJ
 lm7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789606870; x=1790211670;
 h=content-type:cc:to:subject:message-id:date:from:reply-to
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=7TdRIIc93N967XDBumgh+AeyDXEC5b/XjEDz2SJJ0CU=;
 b=kB2R5fMMU+gRBXQKNE90kXUzRnfKMw3lZJSY0UlNvHb4FkBksWCCyJ33P5qQ3U+60j
 Q6Elo9PZre+vAagwl0EIYOBmkBO691wrn2M9QKfohy8wi0G5pzd+qUt1Ovam5rr8z43/
 ihYOcwrq8VFa0KrBPIHPCmah/coIy3J6h5PnP5jgqQ/yjbIpqql+XoLT7ONwos251ein
 yJr4ZjZo1cGq0tHGr21m2ifevKZvW0Ag+URs85kgRtl4y61w9KCUaPL5ySimNX7ntii8
 DYQaqt9EocH3f4lIch+xZNXAKdBMEyDSdTE8krfvtyjv5kO0MjAopcjgYJmXtfDdFPi/
 Hzgg==
X-Forwarded-Encrypted: i=1;
 AKwUvBwiHOU3saHeSrsYBNoFOTEGgPNqUuLLS665FrELwkX6fJwn1ORXIa0LYb0tSJR7HYIyNpmqhfOQmd1d@nongnu.org
X-Gm-Message-State: AFuF++k1tTcUgomFKX32sfGv3/Moz2fYfghsNOvieWBng2zCz9oYU+0X
 aCesUxqFBa63dRCpJzkG4nFxxlGqkV+L46kT/3jBhIdVXNr8Ijqwr+vIufuaVDdidUMIHAPPuL9
 ih1NGy+gT9k12g7qaqaXvEzAF3IKlWis=
X-Gm-Gg: AYBFou1/3vY2bpSG/kZB5YzuXiHMYqlZ6ZJ0Xn8+lZemAq/tTfaW2Yo2mBH7X+YgxMo
 enizS00opFSCYOk4bTl7PcfIA58ec40GaR0cFhW1kEDFrvB5qg+WLLoV2U9+JzprExkmHUWJ/Z/
 e98XsxaGW8j4PRIZ/4a36Z7XAoxvJ0Swb8o6KJHfPtU+YPkgg3mgRT8fNaHHEyLiXpzgV2wTa26
 VyQOOIDdi1sjbSu+Xjy0lQYiU+dtjg3wl2eWldDBzsQ6hC621t9uvXPZuDdxwsaj2rv7yWaUHru
 t1f+6rjjiU8m+umOmJEnR+HFNOr9RPymHqulhsErJfG0M1qC5/AmNj379bLVHjPRiQ==
X-Received: by 2002:a05:6402:44c5:b0:6a9:caf5:ff85 with SMTP id
 4fb4d7f45d1cf-6aa223d83d0mr2691597a12.21.1789606870354; Wed, 16 Sep 2026
 18:01:10 -0700 (PDT)
MIME-Version: 1.0
References: <20260916-hw-riscv-cpu-int-v4-0-babc367b60f5@rev.ng>
 <20260916-hw-riscv-cpu-int-v4-10-babc367b60f5@rev.ng>
 <f692f936-550b-4e5b-90ee-399edf21de73@oss.qualcomm.com>
In-Reply-To: <f692f936-550b-4e5b-90ee-399edf21de73@oss.qualcomm.com>
From: Yonggang Luo <luoyonggang@gmail.com>
Date: Thu, 17 Sep 2026 09:00:56 +0800
X-Gm-Features: AcwNN1W5EMs2lJ9vOmWE26fsfTXatW42w_hZaEXWeWRvC3EIAGzqD93EgfQV1yw
Message-ID: <CAE2XoE9KkW+WPWL1g4hzT6OtkQhfYvaMAopBW4NfFMkXn9hjzQ@mail.gmail.com>
Subject: Re: [PATCH v4 10/12] target-info: Introduce target_riscv32
To: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Cc: Anton Johansson <anjo@rev.ng>, qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 daniel.barboza@oss.qualcomm.com, philmd@oss.qualcomm.com, palmer@dabbelt.com, 
 alistair.francis@wdc.com
Content-Type: multipart/alternative; boundary="000000000000cb8fc4065ba35152"
Received-SPF: pass client-ip=2a00:1450:4864:33::10;
 envelope-from=luoyonggang@gmail.com; helo=mail-ed2-x10.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Reply-To: luoyonggang@gmail.com
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

--000000000000cb8fc4065ba35152
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

As I said before, we need the `const TargetInfo*` parameter to for
is_avaiable.  I've get all accelerator and
i386/x86_64/aarch64/arm/risv32/riscv64/


 single_binary_supported_targets =3D [
   'aarch64-softmmu',
   'arm-softmmu',
+  'i386-softmmu',
   'microblaze-softmmu',
   'riscv32-softmmu',
   'riscv64-softmmu',
+  'x86_64-softmmu',
 ]


On Thu, Sep 17, 2026 at 1:03=E2=80=AFAM Pierrick Bouvier <
pierrick.bouvier@oss.qualcomm.com> wrote:
>
> On 9/16/2026 2:19 AM, Anton Johansson wrote:
> > Will be used in the following commit to filter machines using
> > TypeInfo::is_available, so a simple !target_riscv64() is not sufficient=
.
> >
> > Signed-off-by: Anton Johansson <anjo@rev.ng>
> > ---
> >  include/qemu/target-info.h | 7 +++++++
> >  target-info.c              | 5 +++++
> >  2 files changed, 12 insertions(+)
> >
>
> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
>


 include/qemu/target-info.h | 30 ++++++++++++++++++++++++++++++
 target-info.c              | 26 ++++++++++++++++++++++++++
 2 files changed, 56 insertions(+)

diff --git a/include/qemu/target-info.h b/include/qemu/target-info.h
index 0620a3db84..560d589bcf 100644
--- a/include/qemu/target-info.h
+++ b/include/qemu/target-info.h
@@ -239,6 +239,36 @@ bool target_is_s390x(const TargetInfo *ti);
  */
 bool target_s390x(void);

+/**
+ * target_is_base_riscv:
+ * @ti: TargetInfo to inspect
+ *
+ * Returns whether @ti is RISC-V 32-bit or 64-bit.
+ */
+bool target_is_base_riscv(const TargetInfo *ti);
+
+/**
+ * target_base_riscv:
+ *
+ * Returns whether the target architecture is RISC-V 32-bit or 64-bit.
+ */
+bool target_base_riscv(void);
+
+/**
+ * target_is_riscv32:
+ * @ti: TargetInfo to inspect
+ *
+ * Returns whether @ti is RISC-V 32-bit.
+ */
+bool target_is_riscv32(const TargetInfo *ti);
+
+/**
+ * target_riscv32:
+ *
+ * Returns whether the target architecture is RISC-V 32-bit.
+ */
+bool target_riscv32(void);
+
 /**
  * target_is_riscv64:
  * @ti: TargetInfo to inspect
diff --git a/target-info.c b/target-info.c
index 9083b7bca6..a9fcd1c07b 100644
--- a/target-info.c
+++ b/target-info.c
@@ -250,6 +250,32 @@ bool target_s390x(void)
     return target_is_s390x(target_info());
 }

+bool target_is_base_riscv(const TargetInfo *ti)
+{
+    switch (ti->target_arch) {
+    case SYS_EMU_TARGET_RISCV32:
+    case SYS_EMU_TARGET_RISCV64:
+        return true;
+    default:
+        return false;
+    }
+}
+
+bool target_base_riscv(void)
+{
+    return target_is_base_riscv(target_info());
+}
+
+bool target_is_riscv32(const TargetInfo *ti)
+{
+    return ti->target_arch =3D=3D SYS_EMU_TARGET_RISCV32;
+}
+
+bool target_riscv32(void)
+{
+    return target_is_riscv32(target_info());
+}
+
 bool target_is_riscv64(const TargetInfo *ti)
 {
     return ti->target_arch =3D=3D SYS_EMU_TARGET_RISCV64;


These are the helpers I needed, that are very important.for subsequent
work, otherwise the latter work will be repeated again. and split
target_is_* out again.

Those is_avaiable should use target_is_*, that's differ from
target_riscv32 and so on.
--
         =E6=AD=A4=E8=87=B4
=E7=A4=BC
=E7=BD=97=E5=8B=87=E5=88=9A
Yours
    sincerely,
Yonggang Luo

--000000000000cb8fc4065ba35152
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">As I said before, we need the `const TargetInfo*` paramete=
r to for is_avaiable.=C2=A0 I&#39;ve get all accelerator and i386/x86_64/aa=
rch64/arm/risv32/riscv64/<br><br><br>=C2=A0single_binary_supported_targets =
=3D [<br>=C2=A0 =C2=A0&#39;aarch64-softmmu&#39;,<br>=C2=A0 =C2=A0&#39;arm-s=
oftmmu&#39;,<br>+ =C2=A0&#39;i386-softmmu&#39;,<br>=C2=A0 =C2=A0&#39;microb=
laze-softmmu&#39;,<br>=C2=A0 =C2=A0&#39;riscv32-softmmu&#39;,<br>=C2=A0 =C2=
=A0&#39;riscv64-softmmu&#39;,<br>+ =C2=A0&#39;x86_64-softmmu&#39;,<br>=C2=
=A0]<br>=C2=A0<br><br>On Thu, Sep 17, 2026 at 1:03=E2=80=AFAM Pierrick Bouv=
ier &lt;<a href=3D"mailto:pierrick.bouvier@oss.qualcomm.com">pierrick.bouvi=
er@oss.qualcomm.com</a>&gt; wrote:<br>&gt;<br>&gt; On 9/16/2026 2:19 AM, An=
ton Johansson wrote:<br>&gt; &gt; Will be used in the following commit to f=
ilter machines using<br>&gt; &gt; TypeInfo::is_available, so a simple !targ=
et_riscv64() is not sufficient.<br>&gt; &gt;<br>&gt; &gt; Signed-off-by: An=
ton Johansson &lt;<a href=3D"mailto:anjo@rev.ng">anjo@rev.ng</a>&gt;<br>&gt=
; &gt; ---<br>&gt; &gt; =C2=A0include/qemu/target-info.h | 7 +++++++<br>&gt=
; &gt; =C2=A0target-info.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
| 5 +++++<br>&gt; &gt; =C2=A02 files changed, 12 insertions(+)<br>&gt; &gt;=
<br>&gt;<br>&gt; Reviewed-by: Pierrick Bouvier &lt;<a href=3D"mailto:pierri=
ck.bouvier@oss.qualcomm.com">pierrick.bouvier@oss.qualcomm.com</a>&gt;<br>&=
gt;<br><br><br>=C2=A0include/qemu/target-info.h | 30 ++++++++++++++++++++++=
++++++++<br>=C2=A0target-info.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| 26 ++++++++++++++++++++++++++<br>=C2=A02 files changed, 56 insertio=
ns(+)<br><br>diff --git a/include/qemu/target-info.h b/include/qemu/target-=
info.h<br>index 0620a3db84..560d589bcf 100644<br>--- a/include/qemu/target-=
info.h<br>+++ b/include/qemu/target-info.h<br>@@ -239,6 +239,36 @@ bool tar=
get_is_s390x(const TargetInfo *ti);<br>=C2=A0 */<br>=C2=A0bool target_s390x=
(void);<br>=C2=A0<br>+/**<br>+ * target_is_base_riscv:<br>+ * @ti: TargetIn=
fo to inspect<br>+ *<br>+ * Returns whether @ti is RISC-V 32-bit or 64-bit.=
<br>+ */<br>+bool target_is_base_riscv(const TargetInfo *ti);<br>+<br>+/**<=
br>+ * target_base_riscv:<br>+ *<br>+ * Returns whether the target architec=
ture is RISC-V 32-bit or 64-bit.<br>+ */<br>+bool target_base_riscv(void);<=
br>+<br>+/**<br>+ * target_is_riscv32:<br>+ * @ti: TargetInfo to inspect<br=
>+ *<br>+ * Returns whether @ti is RISC-V 32-bit.<br>+ */<br>+bool target_i=
s_riscv32(const TargetInfo *ti);<br>+<br>+/**<br>+ * target_riscv32:<br>+ *=
<br>+ * Returns whether the target architecture is RISC-V 32-bit.<br>+ */<b=
r>+bool target_riscv32(void);<br>+<br>=C2=A0/**<br>=C2=A0 * target_is_riscv=
64:<br>=C2=A0 * @ti: TargetInfo to inspect<br>diff --git a/target-info.c b/=
target-info.c<br>index 9083b7bca6..a9fcd1c07b 100644<br>--- a/target-info.c=
<br>+++ b/target-info.c<br>@@ -250,6 +250,32 @@ bool target_s390x(void)<br>=
=C2=A0 =C2=A0 =C2=A0return target_is_s390x(target_info());<br>=C2=A0}<br>=
=C2=A0<br>+bool target_is_base_riscv(const TargetInfo *ti)<br>+{<br>+ =C2=
=A0 =C2=A0switch (ti-&gt;target_arch) {<br>+ =C2=A0 =C2=A0case SYS_EMU_TARG=
ET_RISCV32:<br>+ =C2=A0 =C2=A0case SYS_EMU_TARGET_RISCV64:<br>+ =C2=A0 =C2=
=A0 =C2=A0 =C2=A0return true;<br>+ =C2=A0 =C2=A0default:<br>+ =C2=A0 =C2=A0=
 =C2=A0 =C2=A0return false;<br>+ =C2=A0 =C2=A0}<br>+}<br>+<br>+bool target_=
base_riscv(void)<br>+{<br>+ =C2=A0 =C2=A0return target_is_base_riscv(target=
_info());<br>+}<br>+<br>+bool target_is_riscv32(const TargetInfo *ti)<br>+{=
<br>+ =C2=A0 =C2=A0return ti-&gt;target_arch =3D=3D SYS_EMU_TARGET_RISCV32;=
<br>+}<br>+<br>+bool target_riscv32(void)<br>+{<br>+ =C2=A0 =C2=A0return ta=
rget_is_riscv32(target_info());<br>+}<br>+<br>=C2=A0bool target_is_riscv64(=
const TargetInfo *ti)<br>=C2=A0{<br>=C2=A0 =C2=A0 =C2=A0return ti-&gt;targe=
t_arch =3D=3D SYS_EMU_TARGET_RISCV64;<br><br><br>These are the helpers I ne=
eded, that are very important.for subsequent work, otherwise the latter wor=
k will be repeated again. and split=C2=A0

target_is_* out again.<div><br></div><div>Those is_avaiable should use targ=
et_is_*, that&#39;s differ from=C2=A0

target_riscv32 and so on.<br>--<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=E6=AD=
=A4=E8=87=B4<br>=E7=A4=BC<br>=E7=BD=97=E5=8B=87=E5=88=9A<br>Yours<br>=C2=A0=
 =C2=A0 sincerely,<br>Yonggang Luo
</div></div>

--000000000000cb8fc4065ba35152--

