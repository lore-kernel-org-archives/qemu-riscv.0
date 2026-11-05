Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 747B2606D813
	for <qemu-riscv@archiver.kernel.org>; Thu,  5 Nov 2026 15:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XvbKB+Uo
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xOzPP-0005Dl-Vb; Thu, 05 Nov 2026 10:29:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1xOzPO-0005DL-St
 for qemu-riscv@nongnu.org; Thu, 05 Nov 2026 10:29:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1xOzPM-00012i-6a
 for qemu-riscv@nongnu.org; Thu, 05 Nov 2026 10:29:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1793892581;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WnyEFMD5bKu5clECubxywcLnBEDqdA+HPkHOPDgjFAM=;
 b=XvbKB+Uoe4zyiuUFHrLBqq0lG1Muhv6ZWY0vky84Zv+ZKUkDP8niVfw+h0/8N8DgzKvmmM
 UQcj2kr6CrYRJpIfqnBSoc7qDteqX7SzGkXiJr3PXM7yXmoFsiOrLXAq02I8Dn3YYqPeVQ
 D6x7omG53jDhgdVE7UTIPESsDfFmir8=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-43-rMFdczJiOL2YHXPtIvazBw-1; Thu, 05 Nov 2026 10:29:40 -0500
X-MC-Unique: rMFdczJiOL2YHXPtIvazBw-1
X-Mimecast-MFC-AGG-ID: rMFdczJiOL2YHXPtIvazBw_1793892580
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-91e98b67c0fso15628816d6.3
 for <qemu-riscv@nongnu.org>; Thu, 05 Nov 2026 07:29:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793892580; x=1794497380;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=WnyEFMD5bKu5clECubxywcLnBEDqdA+HPkHOPDgjFAM=;
 b=mKiCzVGqhXmLnHJN3ZpudSwQK6gxnUSEx3nelnjyDitM96gHwfHvJJCFjw8KlG1Y6F
 tIrUKsaWnCM6dqg/Yw2tAJFpL0n7sM4EpHqYJThE0iJB4qUmmxF4f50DsOG+6srWXUhQ
 dIqoN6sz73IM3BoJ8Kt3LfyawsOjKXkPUyTymh4APVYrSndBQB+gyn58pzYQnywxqqOR
 SNYd4ruUkvmvNeOZh/dCudZ+MvWinWgid9IpBJKgywS04S0b4s8/kdr0ja6we5rQ27K4
 k8hL/9Pi03daMKUH9VH17+4eZklG+lpUveXhowPLWdE69lyc8cBzGv0HCZDBKMQnOt7I
 j8xQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBwd/NZGVAPLj/4BBVQGzXwYamBTVX/ZyvIqJ5xTaJJU1Kz3vmJJkiLOHlql0KgMOteKjYz6dNuPfygZ@nongnu.org
X-Gm-Message-State: APuU4Z/1nb4oCa/5kBt+lXFDlDg/6E+fWc3F+8G4/Ar4C5cF7ZDGzgJ+
 OLGo/k4Qngn65b8DrN/HiAWRuEdpYPb2v8WG3zX6yzBhMY/J4DCikO5aiy4+QvBnxVKji4p/X7y
 ADogF+9K5rLRISoCoPBabpFQpw8bv8WmymWK93f6sjm27SILqdoU7CmIECX4et8yrnFgBIzoePl
 DHomPDWb0duQM3N0gYWWwK9KZ+jRhbINnseo62mj07z8Ht
X-Gm-Gg: AYBFou1twOmpKRpwTGbuWjl/IO5W93rXqjStcZS/G3+sJ9F5v9b0+L/kmD5ndAgF3BG
 r0/wKqHQa5GC25BFHLU5fhZAw8+7m7lui2lD0S9bcONZqOHlq+wQknflA2D3kH9iPTQuNlhxqPc
 5B4YI88AcvPl4ruLXcG5cW34ThYAuUj88CMFEo6O6ZJx6kA2uSkqgn/V0Fnflb/hRIzL8+JmM4C
 MpI7t+yvRJMo5A8skGUldJY3OFU6kYjSgkrQNoJoLZ0V+zL8HF6mPEISzsligWXGN7E0Z6h+g==
X-Received: by 2002:ad4:4eaa:0:b0:91c:6d30:7c2c with SMTP id
 6a1803df08f44-91ca4ba3932mr328995746d6.52.1793892579605; 
 Thu, 05 Nov 2026 07:29:39 -0800 (PST)
X-Received: by 2002:ad4:4eaa:0:b0:91c:6d30:7c2c with SMTP id
 6a1803df08f44-91ca4ba3932mr328995466d6.52.1793892579079; Thu, 05 Nov 2026
 07:29:39 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261105125203.40320-1-philmd@oss.qualcomm.com>
 <20261105125203.40320-18-philmd@oss.qualcomm.com>
In-Reply-To: <20261105125203.40320-18-philmd@oss.qualcomm.com>
From: Kostiantyn Kostiuk <kkostiuk@redhat.com>
Date: Thu, 5 Nov 2026 17:29:28 +0200
X-Gm-Features: AclHuK9F8ds1NUnep_sO2MDvEwiSehpgOjMaN3-jEOZwX-8jeVoCgePKPh3_RVQ
Message-ID: <CAPMcbCrrqrBf_7ofh1S=c=2DFTpZf1SjaqEYnVM=miKbSCk-FA@mail.gmail.com>
Subject: Re: [PATCH v2 17/17] qga/vss-win32: Replace deprecated sprintf() by
 StrCatBuffA()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, qemu-arm@nongnu.org, 
 qemu-ppc@nongnu.org, Michael Roth <michael.roth@amd.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: EcT4lp6n_my8r05-cIp2iRjDEacjkSX2Dfk6lPRUMEI_1793892580
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000f11ab3065f892969"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kkostiuk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
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
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--000000000000f11ab3065f892969
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 2:54=E2=80=AFPM Philippe Mathieu-Daud=C3=A9 <
philmd@oss.qualcomm.com> wrote:

> Formatting is not necessary, replace the deprecated
> sprintf() by StrCpyNA() and StrCatBuffA() calls.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@oss.qualcomm.com>
> ---
>  qga/vss-win32/install.cpp | 17 ++++++++++++-----
>  1 file changed, 12 insertions(+), 5 deletions(-)
>
> diff --git a/qga/vss-win32/install.cpp b/qga/vss-win32/install.cpp
> index df00588c923a..1a3d5cbf75d5 100644
> --- a/qga/vss-win32/install.cpp
> +++ b/qga/vss-win32/install.cpp
> @@ -562,7 +562,8 @@ STDAPI DllRegisterServer(void)
>
>      /* Add this module to registry */
>
> -    sprintf(key, "CLSID\\%s", g_szClsid);
> +    StrCpyNA(key, "CLSID\\", sizeof(key));
> +    StrCatBuffA(key, g_szClsid, sizeof(key));
>

MSFT does not recommend to use StrCatBuffA due to security warning.
What about using StringCchCatA instead of snprintf, even in this case?


>      if (!CreateRegistryKey(key, NULL, g_szClsid)) {
>          goto out;
>      }
> @@ -572,7 +573,9 @@ STDAPI DllRegisterServer(void)
>          goto out;
>      }
>
> -    sprintf(key, "CLSID\\%s\\InprocServer32", g_szClsid);
> +    StrCpyNA(key, "CLSID\\", sizeof(key));
> +    StrCatBuffA(key, g_szClsid, sizeof(key));
> +    StrCatBuffA(key, "\\InprocServer32", sizeof(key));
>      if (!CreateRegistryKey(key, NULL, dllPath)) {
>          goto out;
>      }
> @@ -581,7 +584,9 @@ STDAPI DllRegisterServer(void)
>          goto out;
>      }
>
> -    sprintf(key, "CLSID\\%s\\ProgID", g_szClsid);
> +    StrCpyNA(key, "CLSID\\", sizeof(key));
> +    StrCatBuffA(key, g_szClsid, sizeof(key));
> +    StrCatBuffA(key, "\\ProgID", sizeof(key));
>      if (!CreateRegistryKey(key, NULL, g_szProgid)) {
>          goto out;
>      }
> @@ -590,7 +595,8 @@ STDAPI DllRegisterServer(void)
>          goto out;
>      }
>
> -    sprintf(key, "%s\\CLSID", g_szProgid);
> +    StrCpyNA(key, g_szProgid, sizeof(key));
> +    StrCatBuffA(key, "\\CLSID", sizeof(key));
>      if (!CreateRegistryKey(key, NULL, g_szClsid)) {
>          goto out;
>      }
> @@ -651,7 +657,8 @@ STDAPI DllUnregisterServer(void)
>          errmsg(hr, "CoCreateInstance(VSSCoordinator) failed");
>      }
>
> -    sprintf(key, "CLSID\\%s", g_szClsid);
> +    StrCpyNA(key, "CLSID\\", sizeof(key));
> +    StrCatBuffA(key, g_szClsid, sizeof(key));
>      SHDeleteKey(HKEY_CLASSES_ROOT, key);
>      SHDeleteKey(HKEY_CLASSES_ROOT, g_szProgid);
>
> --
> 2.55.0
>
>

--000000000000f11ab3065f892969
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Nov 5, =
2026 at 2:54=E2=80=AFPM Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:p=
hilmd@oss.qualcomm.com">philmd@oss.qualcomm.com</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">Formatting is not necessary,=
 replace the deprecated<br>
sprintf() by StrCpyNA() and StrCatBuffA() calls.<br>
<br>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@oss=
.qualcomm.com" target=3D"_blank">philmd@oss.qualcomm.com</a>&gt;<br>
---<br>
=C2=A0qga/vss-win32/install.cpp | 17 ++++++++++++-----<br>
=C2=A01 file changed, 12 insertions(+), 5 deletions(-)<br>
<br>
diff --git a/qga/vss-win32/install.cpp b/qga/vss-win32/install.cpp<br>
index df00588c923a..1a3d5cbf75d5 100644<br>
--- a/qga/vss-win32/install.cpp<br>
+++ b/qga/vss-win32/install.cpp<br>
@@ -562,7 +562,8 @@ STDAPI DllRegisterServer(void)<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* Add this module to registry */<br>
<br>
-=C2=A0 =C2=A0 sprintf(key, &quot;CLSID\\%s&quot;, g_szClsid);<br>
+=C2=A0 =C2=A0 StrCpyNA(key, &quot;CLSID\\&quot;, sizeof(key));<br>
+=C2=A0 =C2=A0 StrCatBuffA(key, g_szClsid, sizeof(key));<br></blockquote><d=
iv><br></div><div>MSFT does not recommend=C2=A0to use=C2=A0StrCatBuffA due =
to security warning.</div><div>What about using=C2=A0StringCchCatA instead =
of snprintf, even in this case?</div><div>=C2=A0</div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0if (!CreateRegistryKey(key, NULL, g_szClsid)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
@@ -572,7 +573,9 @@ STDAPI DllRegisterServer(void)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 sprintf(key, &quot;CLSID\\%s\\InprocServer32&quot;, g_szClsi=
d);<br>
+=C2=A0 =C2=A0 StrCpyNA(key, &quot;CLSID\\&quot;, sizeof(key));<br>
+=C2=A0 =C2=A0 StrCatBuffA(key, g_szClsid, sizeof(key));<br>
+=C2=A0 =C2=A0 StrCatBuffA(key, &quot;\\InprocServer32&quot;, sizeof(key));=
<br>
=C2=A0 =C2=A0 =C2=A0if (!CreateRegistryKey(key, NULL, dllPath)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
@@ -581,7 +584,9 @@ STDAPI DllRegisterServer(void)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 sprintf(key, &quot;CLSID\\%s\\ProgID&quot;, g_szClsid);<br>
+=C2=A0 =C2=A0 StrCpyNA(key, &quot;CLSID\\&quot;, sizeof(key));<br>
+=C2=A0 =C2=A0 StrCatBuffA(key, g_szClsid, sizeof(key));<br>
+=C2=A0 =C2=A0 StrCatBuffA(key, &quot;\\ProgID&quot;, sizeof(key));<br>
=C2=A0 =C2=A0 =C2=A0if (!CreateRegistryKey(key, NULL, g_szProgid)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
@@ -590,7 +595,8 @@ STDAPI DllRegisterServer(void)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 sprintf(key, &quot;%s\\CLSID&quot;, g_szProgid);<br>
+=C2=A0 =C2=A0 StrCpyNA(key, g_szProgid, sizeof(key));<br>
+=C2=A0 =C2=A0 StrCatBuffA(key, &quot;\\CLSID&quot;, sizeof(key));<br>
=C2=A0 =C2=A0 =C2=A0if (!CreateRegistryKey(key, NULL, g_szClsid)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
@@ -651,7 +657,8 @@ STDAPI DllUnregisterServer(void)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0errmsg(hr, &quot;CoCreateInstance(VSSCoor=
dinator) failed&quot;);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 sprintf(key, &quot;CLSID\\%s&quot;, g_szClsid);<br>
+=C2=A0 =C2=A0 StrCpyNA(key, &quot;CLSID\\&quot;, sizeof(key));<br>
+=C2=A0 =C2=A0 StrCatBuffA(key, g_szClsid, sizeof(key));<br>
=C2=A0 =C2=A0 =C2=A0SHDeleteKey(HKEY_CLASSES_ROOT, key);<br>
=C2=A0 =C2=A0 =C2=A0SHDeleteKey(HKEY_CLASSES_ROOT, g_szProgid);<br>
<br>
-- <br>
2.55.0<br>
<br>
</blockquote></div></div>

--000000000000f11ab3065f892969--


