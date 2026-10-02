Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B68FCA5FDD
	for <qemu-riscv@archiver.kernel.org>; Fri,  2 Oct 2026 18:08:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xChg0-0002oM-PI; Fri, 02 Oct 2026 14:08:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xChfK-0002Cf-IV
 for qemu-riscv@nongnu.org; Fri, 02 Oct 2026 14:07:36 -0400
Received: from mail-ed2-x0c.google.com ([2a00:1450:4864:33::c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xChfI-00015Y-Hw
 for qemu-riscv@nongnu.org; Fri, 02 Oct 2026 14:07:26 -0400
Received: by mail-ed2-x0c.google.com with SMTP id
 4fb4d7f45d1cf-6acb88abebdso282478a12.1
 for <qemu-riscv@nongnu.org>; Fri, 02 Oct 2026 11:07:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790964443; cv=none;
 d=google.com; s=arc-20260327;
 b=WOK2JMPVbnFKfkFQfi38rSi/0nY8/daEbji1ndSJm6rRt0EhE7Ix+dGE1meS0U0CQz
 Eew4GCcwH6C3BcHlLxjGM+3jJlwZ8BsQXQh12gkXGYgRPUCXwmb5EFB325lYxNQTiNBE
 Yyz3GG8h1rIfGQtQub5nUVCHd9m/WCYQ7yPhTDnj87EsAwXUQApyKygFSydXjUrwvGiZ
 p0czIOXCOoJuqUj/8nlNI5fsmooKAB1jgAafceHLc0TlDArrk+QtGqQz0MioEel+CiuD
 2VHEzGGaqfSEmkpv49fL1ZWFprkCp63a5jdU484udtv3UFbnzUGdtVQXt8Olq9WsOrZi
 FT6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:reply-to:in-reply-to:references
 :mime-version:dkim-signature;
 bh=6QdMYUD3lRG1Bj9A6I+iBn991Jd0ZSPxjiMHO5cGzhU=;
 fh=KPS99xdF2sMZecPj4KARW+V/5prr/alBywRGmPdLGEM=;
 b=e90uzyI01UH6hlGxDcJvqrc+4ujQDMVgr8oc4C2NNi28qq4N9YWsCcCnrw9JLqOPPB
 tE1pzLfXrJsRplze/tN8lgBFvCTItqelbTBVeYPb8AjtAMqPqyo3GJ7izMn0CjgIkt9B
 y3uziBWmXwAbxWEnpi2E4BFwREpgPTXw++zR4FhFY0PJyLOO+GzCw0eAD1PL81R5H8M5
 ITavaU7RfNlJMtjVLMySGMI9p9T0IIYib6PYHEwBbIJc2oaz2PCm5yU8xqXGIOAlHlF3
 ZBZv7V+66Qwe1SIy6ogFOTk2oomKLce0TfRsbwbwrABLkk6tMDNVcV/1NylGekPKFx0S
 3UFA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790964443; x=1791569243; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:reply-to
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=6QdMYUD3lRG1Bj9A6I+iBn991Jd0ZSPxjiMHO5cGzhU=;
 b=RTsqA8py81AlAyM/Ey3ZIclm8uPdywPs6pntyg1u+N/yF9YI81kdYYRRBbT9+wjEFF
 YeNkN8AA+vn2LXIXOWUhnABfJJCW3tAhUpitSvI8kmQqNW1DAvG7skSl/xE5R1tx4sRf
 MluPlMK7rWE/dmo8C04Oi/LAUEnQvgkvJ9/ey+hEx41p0k5XuaB2MDhjZ+5/xudxLlcV
 YqSwRXTNY0D/jBY4aEccRpclH8ukTxPZqQwRNApDfSor9II3dbHxxRK4pAnk2mlkY6i4
 UWnrtIA7yXUJj//mbqFsUsYlyg1Y1bYjavARHIIZo4UBbtea0SBQOKnLFnkhRRIe27nx
 S7iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790964443; x=1791569243;
 h=content-type:cc:to:subject:message-id:date:from:reply-to
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=6QdMYUD3lRG1Bj9A6I+iBn991Jd0ZSPxjiMHO5cGzhU=;
 b=lCv0fcMUsZ1bcEDziwS29sl0XCk15/phrWHmbfjt9nzsdEtykaanu2lS4S8oIAblK8
 jcy42mJRXKdVmjXeckFprj8ZPIK4rDI66e3B9fTx474PPQzg9sXYXzDkzsC5Lbz7U9MT
 +svJ1f0ulh1gcXmVrT6a2rmPdHJg63ZFRI5dHkR+PomQKTDKQFCPI5GmQoGG83Pi6zUL
 5UmuuTjepNXJoqmg8FyRY+10cZ0spelFL6wsYOzHUPLdhiKGazD9ZukMAkr6pxJAM9ii
 4Ht1nWiXu3d3V4bOcDtkTLMthXpD8p7eGSRgJGLePj5/68pUeIZvapdiRTeuV+WyunFO
 Jr+Q==
X-Forwarded-Encrypted: i=1;
 AKwUvBybWqrolL0+MTaQK0MHsv53LSMFlIM2PJlGHcZswEHBnB2rliIl3yjDDkVhjljx4RL/uoq7oz986NHD@nongnu.org
X-Gm-Message-State: AFq9FYKkSyAUVFr2QfgUygaKy+2oPGnYYykFBWjqs45wR4xiVsBmsAgJ
 r6dx0XII/39+6alGXu3Hj/TD4A31p4nIK8JLp8eJITmV4BPZTVWUqrR8uItbSybfbpqOikj7MZ3
 oJSc6aHvMs8xBHgjPmMQZqKCgayX3mz8=
X-Gm-Gg: AYBFou3nyxy1mk+k5bzoj3sAYUFZy6m0sRJnkOrAWnbTlKCyzRWr6VhQVT2H3J9M+Nv
 b7w91DS6owPop/TFH3EbGXNdw64IQeOfnZHdgvI7w8TdjlN/IMfvKThbyJujLe768UBhrOY/UZ7
 jPKBZJ+DdXCWnT0gquzTvk4kKLSqdQOPFQ4EdtVEhoYxvTdnEAFx+nGOPDlgsUb2/nteLsl9LZ9
 hXUUhR/kGBSX4of5E5fuJZGQPQ3U2yQDJjHg8wZSKyKOcw75zJIoGimaSzETZ+A151Hs5O1rqQH
 Uw8aLsPeVrrzi61O9T/YGR2pCPT1U/B/W07bcspRZie32zmOvwqY0cyU+By13jJ24u8=
X-Received: by 2002:a05:6402:24ce:b0:6aa:734b:1a28 with SMTP id
 4fb4d7f45d1cf-6af9e2ecaedmr1899769a12.34.1790964442424; Fri, 02 Oct 2026
 11:07:22 -0700 (PDT)
MIME-Version: 1.0
References: <20261001-rv-dedup-v1-0-ea69b07afd31@rev.ng>
 <20261001-rv-dedup-v1-7-ea69b07afd31@rev.ng>
 <CAE2XoE_ag1RR_JFwgcg+9zPed+qpO2skf7W1_kiqvwB=Vf9aAQ@mail.gmail.com>
 <f8f27bc3-83ce-4ccf-ae38-a43188b2ebc5@oss.qualcomm.com>
 <ar_AzEWpF9XDGNdg@hive.localdomain>
In-Reply-To: <ar_AzEWpF9XDGNdg@hive.localdomain>
From: Yonggang Luo <luoyonggang@gmail.com>
Date: Sat, 3 Oct 2026 02:07:08 +0800
X-Gm-Features: AclHuK8jeeqrBIeLEQk0WzZH3UqzYofOSJR5_ayEbariFLjWbJZZyb52zf4nZho
Message-ID: <CAE2XoE_vsVDXH2qggECnqHC8dMpo7zyTTg9w64uvjnPeXE9y6A@mail.gmail.com>
Subject: Re: [PATCH 07/18] target/riscv: Runtime register MAX and BARE CPUs
To: Anton Johansson <anjo@rev.ng>
Cc: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, daniel.barboza@oss.qualcomm.com, 
 philmd@oss.qualcomm.com, palmer@dabbelt.com, alistair.francis@wdc.com
Content-Type: multipart/mixed; boundary="00000000000065b75f065cdf67bc"
Received-SPF: pass client-ip=2a00:1450:4864:33::c;
 envelope-from=luoyonggang@gmail.com; helo=mail-ed2-x0c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Reply-To: luoyonggang@gmail.com
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

--00000000000065b75f065cdf67bc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

target/riscv: resolve target-dependent CPU definition fields

The class-base initializer later reads def->misa_mxl_max and passes
def->cfg to riscv_cpu_cfg_merge(), which merges max_satp_mode. Resolve
both chooser results in a mutable copy so those steps use the selected
values without modifying the const TypeInfo class data.


defer riscv_cpu_validate_misa_mxl is not enough, mainly
def->misa_mxl_max is accessed in
riscv_cpu_class_base_init, for exactly match previous behavior, add
two callback for each value

On Fri, Oct 2, 2026 at 11:36=E2=80=AFPM Anton Johansson <anjo@rev.ng> wrote=
:
>
> On 02/10/26, Pierrick Bouvier wrote:
> > On 10/1/2026 9:28 AM, Yonggang Luo wrote:
> > > On Thu, Oct 1, 2026 at 11:55=E2=80=AFPM Anton Johansson via qemu deve=
lopment
> > > <qemu-devel@nongnu.org> wrote:
> > >>
> > >> Moves initialization of satp and mxl fields to a class initializatio=
n
> > >> function that checks target_riscv64().
> > >>
> > >> Note: I'm aware the current iteration of this patch is rather hacky,=
 I
> > >> don't like the introduction of runtime_misa_mxl_max, but I'm keeping
> > >> this in to get the series out there and collect feedback.
> > >>
> > >> Signed-off-by: Anton Johansson <anjo@rev.ng>
> > >> ---
> > >>  target/riscv/cpu.h |  1 +
> > >>  target/riscv/cpu.c | 90 +++++++++++++++++++++++++++++++++++--------=
-----------
> > >>  2 files changed, 59 insertions(+), 32 deletions(-)
> > >>
> > >
> > > This patch is how I handle these, just for reference, not a review.
> >
> > Yonggang approach looks cleaner, I would favor this one.
>
> I'm personally not a huge fan, it still feels rather hacky. Why add a
> completely new RISCVCPUDef::target_init just to make sure fields are
> initialized before riscv_cpu_validate_misa_mxl()? Wouldn't moving the
> check to a later point, maybe .instance_init, be better? Then for
> riscv_cpu_init() we get
>
>   riscv_cpu_validate_misa_mxl(mcc);
>   env->misa_mxl =3D mcc->def->misa_mxl_max;
>
> misa_mxl_max would be verified only during instance rather than
> class initialization, which seems like a decent tradeoff for a simpler
> solution.
>
> --
> Anton Johansson
> rev.ng Labs Srl.



--=20
         =E6=AD=A4=E8=87=B4
=E7=A4=BC
=E7=BD=97=E5=8B=87=E5=88=9A
Yours
    sincerely,
Yonggang Luo

--00000000000065b75f065cdf67bc
Content-Type: text/plain; charset="US-ASCII"; 
	name="0001-target-riscv-resolve-target-dependent-CPU-definition.patch"
Content-Disposition: attachment; 
	filename="0001-target-riscv-resolve-target-dependent-CPU-definition.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_mur9xek10>
X-Attachment-Id: f_mur9xek10

RnJvbSAzMTEzODg5MmZlNWNmODc4ZGE5ODE4Y2Y5MzUzNWNlMTBiMTI1Y2IwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBZb25nZ2FuZyBMdW8gPGx1b3lvbmdnYW5nQGdtYWlsLmNvbT4K
RGF0ZTogU2F0LCAzIE9jdCAyMDI2IDAxOjU0OjUyICswODAwClN1YmplY3Q6IFtQQVRDSF0gdGFy
Z2V0L3Jpc2N2OiByZXNvbHZlIHRhcmdldC1kZXBlbmRlbnQgQ1BVIGRlZmluaXRpb24gZmllbGRz
CgpUaGUgY2xhc3MtYmFzZSBpbml0aWFsaXplciBsYXRlciByZWFkcyBkZWYtPm1pc2FfbXhsX21h
eCBhbmQgcGFzc2VzCmRlZi0+Y2ZnIHRvIHJpc2N2X2NwdV9jZmdfbWVyZ2UoKSwgd2hpY2ggbWVy
Z2VzIG1heF9zYXRwX21vZGUuIFJlc29sdmUKYm90aCBjaG9vc2VyIHJlc3VsdHMgaW4gYSBtdXRh
YmxlIGNvcHkgc28gdGhvc2Ugc3RlcHMgdXNlIHRoZSBzZWxlY3RlZAp2YWx1ZXMgd2l0aG91dCBt
b2RpZnlpbmcgdGhlIGNvbnN0IFR5cGVJbmZvIGNsYXNzIGRhdGEuCgpTaWduZWQtb2ZmLWJ5OiBZ
b25nZ2FuZyBMdW8gPGx1b3lvbmdnYW5nQGdtYWlsLmNvbT4KLS0tCiB0YXJnZXQvcmlzY3YvY3B1
LmMgfCA0MCArKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tCiB0YXJnZXQv
cmlzY3YvY3B1LmggfCAgMiArKwogMiBmaWxlcyBjaGFuZ2VkLCAyOSBpbnNlcnRpb25zKCspLCAx
MyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS90YXJnZXQvcmlzY3YvY3B1LmMgYi90YXJnZXQv
cmlzY3YvY3B1LmMKaW5kZXggYzZmMTczOTA3NS4uNzU0ZjE1ODI1MCAxMDA2NDQKLS0tIGEvdGFy
Z2V0L3Jpc2N2L2NwdS5jCisrKyBiL3RhcmdldC9yaXNjdi9jcHUuYwpAQCAtMzA5Miw2ICszMDky
LDggQEAgc3RhdGljIHZvaWQgcmlzY3ZfY3B1X2NsYXNzX2Jhc2VfaW5pdChPYmplY3RDbGFzcyAq
YywgY29uc3Qgdm9pZCAqZGF0YSkKIAogICAgIGlmIChwY2MtPmRlZikgewogICAgICAgICBtY2Mt
PmRlZiA9IGdfbWVtZHVwMihwY2MtPmRlZiwgc2l6ZW9mKCpwY2MtPmRlZikpOworICAgICAgICBt
Y2MtPmRlZi0+bWF4X3NhdHBfbW9kZV9jaG9vc2UgPSBOVUxMOworICAgICAgICBtY2MtPmRlZi0+
bWlzYV9teGxfbWF4X2Nob29zZSA9IE5VTEw7CiAgICAgfSBlbHNlIHsKICAgICAgICAgbWNjLT5k
ZWYgPSBnX25ldzAoUklTQ1ZDUFVEZWYsIDEpOwogICAgIH0KQEAgLTMxMDgsNyArMzExMCwxNiBA
QCBzdGF0aWMgdm9pZCByaXNjdl9jcHVfY2xhc3NfYmFzZV9pbml0KE9iamVjdENsYXNzICpjLCBj
b25zdCB2b2lkICpkYXRhKQogI2VuZGlmCiAKICAgICBpZiAoZGF0YSkgewotICAgICAgICBjb25z
dCBSSVNDVkNQVURlZiAqZGVmID0gZGF0YTsKKyAgICAgICAgUklTQ1ZDUFVEZWYgZGVmX2RhdGEg
PSAqKGNvbnN0IFJJU0NWQ1BVRGVmICopZGF0YTsKKyAgICAgICAgUklTQ1ZDUFVEZWYgKmRlZiA9
ICZkZWZfZGF0YTsKKworICAgICAgICBpZiAoZGVmLT5tYXhfc2F0cF9tb2RlX2Nob29zZSkgewor
ICAgICAgICAgICAgZGVmLT5jZmcubWF4X3NhdHBfbW9kZSA9IGRlZi0+bWF4X3NhdHBfbW9kZV9j
aG9vc2UoZGVmKTsKKyAgICAgICAgfQorICAgICAgICBpZiAoZGVmLT5taXNhX214bF9tYXhfY2hv
b3NlKSB7CisgICAgICAgICAgICBkZWYtPm1pc2FfbXhsX21heCA9IGRlZi0+bWlzYV9teGxfbWF4
X2Nob29zZShkZWYpOworICAgICAgICB9CisKICAgICAgICAgbWNjLT5kZWYtPmJhcmUgfD0gZGVm
LT5iYXJlOwogICAgICAgICBpZiAoZGVmLT5wcm9maWxlKSB7CiAgICAgICAgICAgICBhc3NlcnQo
cHJvZmlsZV9leHRlbmRzKGRlZi0+cHJvZmlsZSwgbWNjLT5kZWYtPnByb2ZpbGUpKTsKQEAgLTMy
OTksNiArMzMxMCwxOCBAQCBzdGF0aWMgdm9pZCByaXNjdl9jcHVfaW5zdGFuY2VfZmluYWxpemUo
T2JqZWN0ICpvYmopCiAgICAgZ19jbGVhcl9wb2ludGVyKCZjcHUtPm11bHRpX2V4dF91c2VyX29w
dHMsIGdfaGFzaF90YWJsZV9kZXN0cm95KTsKIH0KIAorc3RhdGljIGludDhfdCByaXNjdl9jcHVf
bWF4X3NhdHBfbW9kZV9jaG9vc2UoY29uc3QgUklTQ1ZDUFVEZWYgKmRlZikKK3sKKyAgICAodm9p
ZClkZWY7CisgICAgcmV0dXJuIHRhcmdldF9yaXNjdjMyKCkgPyBWTV8xXzEwX1NWMzIgOiBWTV8x
XzEwX1NWNTc7Cit9CisKK3N0YXRpYyBSSVNDVk1YTCByaXNjdl9jcHVfbWlzYV9teGxfbWF4X2No
b29zZShjb25zdCBSSVNDVkNQVURlZiAqZGVmKQoreworICAgICh2b2lkKWRlZjsKKyAgICByZXR1
cm4gdGFyZ2V0X3Jpc2N2MzIoKSA/IE1YTF9SVjMyIDogTVhMX1JWNjQ7Cit9CisKIHN0YXRpYyBj
b25zdCBUeXBlSW5mbyByaXNjdl9jcHVfdHlwZV9pbmZvc1tdID0gewogICAgIHsKICAgICAgICAg
Lm5hbWUgPSBUWVBFX1JJU0NWX0NQVSwKQEAgLTMzMzksMjEgKzMzNjIsMTIgQEAgc3RhdGljIGNv
bnN0IFR5cGVJbmZvIHJpc2N2X2NwdV90eXBlX2luZm9zW10gPSB7CiAgICAgICAgICAqIG9ubHkg
TUJBUkUgd2lsbCBiZSBhdmFpbGFibGUgaWYgdGhlIHVzZXIgZG9lc24ndCBlbmFibGUKICAgICAg
ICAgICogYSBtb2RlIG1hbnVhbGx5IChzZWUgcmlzY3ZfY3B1X3NhdHBfbW9kZV9maW5hbGl6ZSgp
KS4KICAgICAgICAgICovCi0jaWZkZWYgVEFSR0VUX1JJU0NWMzIKLSAgICAgICAgLmNmZy5tYXhf
c2F0cF9tb2RlID0gVk1fMV8xMF9TVjMyLAotI2Vsc2UKLSAgICAgICAgLmNmZy5tYXhfc2F0cF9t
b2RlID0gVk1fMV8xMF9TVjU3LAotI2VuZGlmCisgICAgICAgIC5tYXhfc2F0cF9tb2RlX2Nob29z
ZSA9IHJpc2N2X2NwdV9tYXhfc2F0cF9tb2RlX2Nob29zZSwKICAgICApLAogCiAgICAgREVGSU5F
X1JJU0NWX0NQVShUWVBFX1JJU0NWX0NQVV9NQVgsIFRZUEVfUklTQ1ZfRFlOQU1JQ19DUFUsCi0j
aWYgZGVmaW5lZChUQVJHRVRfUklTQ1YzMikKLSAgICAgICAgLm1pc2FfbXhsX21heCA9IE1YTF9S
VjMyLAotICAgICAgICAuY2ZnLm1heF9zYXRwX21vZGUgPSBWTV8xXzEwX1NWMzIsCi0jZWxpZiBk
ZWZpbmVkKFRBUkdFVF9SSVNDVjY0KQotICAgICAgICAubWlzYV9teGxfbWF4ID0gTVhMX1JWNjQs
Ci0gICAgICAgIC5jZmcubWF4X3NhdHBfbW9kZSA9IFZNXzFfMTBfU1Y1NywKLSNlbmRpZgorICAg
ICAgICAubWF4X3NhdHBfbW9kZV9jaG9vc2UgPSByaXNjdl9jcHVfbWF4X3NhdHBfbW9kZV9jaG9v
c2UsCisgICAgICAgIC5taXNhX214bF9tYXhfY2hvb3NlID0gcmlzY3ZfY3B1X21pc2FfbXhsX21h
eF9jaG9vc2UsCiAgICAgKSwKIAogICAgIERFRklORV9BQlNUUkFDVF9SSVNDVl9DUFUoVFlQRV9S
SVNDVl9DUFVfU0lGSVZFX0UsIFRZUEVfUklTQ1ZfVkVORE9SX0NQVSwKZGlmZiAtLWdpdCBhL3Rh
cmdldC9yaXNjdi9jcHUuaCBiL3RhcmdldC9yaXNjdi9jcHUuaAppbmRleCAwMzRkN2U5NmM0Li5i
NmI1ZjY3OWM5IDEwMDY0NAotLS0gYS90YXJnZXQvcmlzY3YvY3B1LmgKKysrIGIvdGFyZ2V0L3Jp
c2N2L2NwdS5oCkBAIC01OTcsNiArNTk3LDggQEAgdHlwZWRlZiBzdHJ1Y3QgUklTQ1ZDUFVEZWYg
ewogI2VuZGlmCiAgICAgLyogVGhpcyBpcyBqdXN0IGEgc2V0dGVyIGZvciBlbnYtPm51bV90cmln
Z2Vycy4gICovCiAgICAgdWludDMyX3QgbnVtX3RyaWdnZXJzOworICAgIGludDhfdCAoKm1heF9z
YXRwX21vZGVfY2hvb3NlKShjb25zdCBzdHJ1Y3QgUklTQ1ZDUFVEZWYgKmRlZik7CisgICAgUklT
Q1ZNWEwgKCptaXNhX214bF9tYXhfY2hvb3NlKShjb25zdCBzdHJ1Y3QgUklTQ1ZDUFVEZWYgKmRl
Zik7CiB9IFJJU0NWQ1BVRGVmOwogCiAvKioKLS0gCjIuNTUuMC53aW5kb3dzLjMKCg==
--00000000000065b75f065cdf67bc--

