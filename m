Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4282CCCD19A
	for <qemu-riscv@archiver.kernel.org>; Fri, 17 Oct 2025 11:43:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v9irZ-000818-2f; Fri, 17 Oct 2025 07:43:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1v9irX-00080N-UN
 for qemu-riscv@nongnu.org; Fri, 17 Oct 2025 07:43:12 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1v9irS-0006yn-IO
 for qemu-riscv@nongnu.org; Fri, 17 Oct 2025 07:43:11 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-46e6a689bd0so17177205e9.1
 for <qemu-riscv@nongnu.org>; Fri, 17 Oct 2025 04:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760701380; x=1761306180; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vtkXUPZ+FJHq4D4q+sXYhLI4KkKIks5S7DHAoPN3WmY=;
 b=mDpZ7lNpDHgrQkqZWAsb+gIf97yuk2ZgblydHC1yXlIgobMeTKAEJrj0hP7irmOAJP
 bShANYE+6pNnR1R17mVLPyVyMSFIIwIVzxrgrAKhOcjgsbo1nSgpHHjnpzKF36zlMjrb
 zJqL+SDJcSTrd9N1uDMt/bjbdTnNACLBy5f1/Bf9+Jw3VO7EGB48nYi8tK9vxaK+qjMe
 JLpPZwtVaQgRV/94FjbSyBq27iZUHc3LoNkaOXqnPpEMV7YiJn6XMa6vu1SWsuH+U+e7
 bTz2ew7hjn7BAr7j2LP3frOBselulivnsrMC2i1mbAB4mGeL6ilfyZLV4fiJUxovbi2V
 tFDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760701380; x=1761306180;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vtkXUPZ+FJHq4D4q+sXYhLI4KkKIks5S7DHAoPN3WmY=;
 b=iUN6CSPVdwQEIUW7YPKuBA6oXOsKXEuVAstoiyrRyy+jF6q3IfB6QgOVP2MmyNGWEa
 jeGA96ZiFT0Ip1ZHUrbYQIufkbPsCNFo/qIFmbiiJdLtq56cE3gAAewnXLH9MjDoPKhN
 CjsKqZwDra8tXWveiwmLOLefVAinKgLqAmXps3Riy/ZQiF8fhk9LhD2XcphFPftb2Qxc
 eJiaUDj8CHnfozwYeqIP3hdIqwP6fzU/KdSECr9HGBry7GrUioO54GVGMBlXCGBiF5xz
 94Rff9pfRvdvVoAQa4xiLhS/a8QCHbKkVJbBLg8Ldm7PpkazcCMzkmmFt+mVlcVa6bTM
 zlpg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUI+jhfQodCDcEhE2CVcz55b0hfZsdRnv19+IFDHYE4uiryfus0AVP6/pz/4NefsSS6z89gn+5qYXMT@nongnu.org
X-Gm-Message-State: AOJu0Yys0t+KHxEhqwFmu33p9+ChFPyhrObR5tMR8qk7SFb3B3goSqS4
 /Er/NGG+rcFxjC5are5ASQUQkGeKKMaxYwamfb1CWHQwuCcDy3i665+h
X-Gm-Gg: ASbGncuko54ANHx6q4lnQiWIaWsOa3woDCQ/FOvYVdqfO+hZH0w7x8H5DaLEpe/ppLB
 hOLqrsm7f8BwpowMIwsxeXGc+B8xffL/6AoGNRntY+xss0FcXKbY1oc/A2z1Kx9MP0S+ZCxDpuU
 PNH/goPEISZ5oSjXiBzGAmJ7PxulmBfdG7D5aJJ4a1Xv6mBlT3QrFClFJhxdVd1pHKXCDzghIua
 wioXlXYJxpXty6v3UvPSee2P7b6ge+J6fLq1H0rZVnZR6/D+XexSmbDbIRWktm4G1F3njENX2RN
 c3L88M89owMo+EAXRKjm1jv4Uyyr0OcJX+34qDL7JmyNbWMoVdY6nOp3feDtyUSKetIZM8abjNN
 ooy82rRvhl/lRtEbPSmLBmHoGvAkopIksWyB3ALvhaGIVTlK3eim75vCaBroJh1LaPBqovf4SKp
 JPLNv26124X5xmhNENTC8K9sd4izHErPW1DD7d1GXv3+kUO36+d8A4rnq9IwGQSnTCLtaYTE13N
 6ZcliSkFUw=
X-Google-Smtp-Source: AGHT+IH3NNUGgoTNK9S+ThtcUxCnFz4Az7wSRfUcQjL767TvUvfPXuL1LYA/VOCUVylN3aXLrBVjHg==
X-Received: by 2002:a05:600c:540c:b0:46e:46c8:edac with SMTP id
 5b1f17b1804b1-471178a6f9emr22021845e9.11.1760701379934; 
 Fri, 17 Oct 2025 04:42:59 -0700 (PDT)
Received: from ehlo.thunderbird.net
 (p200300faaf271400485132244674f203.dip0.t-ipconnect.de.
 [2003:fa:af27:1400:4851:3224:4674:f203])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-471143663afsm78119945e9.0.2025.10.17.04.42.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Oct 2025 04:42:59 -0700 (PDT)
Date: Fri, 17 Oct 2025 11:42:55 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
CC: Stefan Hajnoczi <stefanha@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, Huacai Chen <chenhuacai@kernel.org>,
 qemu-s390x@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Song Gao <gaosong@loongson.cn>, Bibo Mao <maobibo@loongson.cn>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2=5D_docs/system/security=3A_Restrict_?=
 =?US-ASCII?Q?=22virtualization_use_case=22_to_specific_machines?=
In-Reply-To: <20251016131159.750480-1-peter.maydell@linaro.org>
References: <20251016131159.750480-1-peter.maydell@linaro.org>
Message-ID: <6A26FCF8-572B-42CF-B75E-3A290AA46D61@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=shentey@gmail.com; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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



Am 16=2E Oktober 2025 13:11:59 UTC schrieb Peter Maydell <peter=2Emaydell@=
linaro=2Eorg>:
>Currently our security policy defines a "virtualization use case"
>where we consider bugs to be security issues, and a
>"non-virtualization use case" where we do not make any security
>guarantees and don't consider bugs to be security issues=2E
>
>The rationale for this split is that much code in QEMU is older and
>was not written with malicious guests in mind, and we don't have the
>resources to audit, fix and defend it=2E  So instead we inform users
>about what the can in practice rely on as a security barrier, and
>what they can't=2E
>
>We don't currently restrict the "virtualization use case" to any
>particular set of machine types=2E  This means that we have effectively
>barred ourselves from adding KVM support to any machine type that we
>don't want to put into the "bugs are security issues" category, even
>if it would be useful for users to be able to get better performance
>with a trusted guest by enabling KVM=2E This seems an unnecessary
>restriction, and in practice the set of machine types it makes
>sense to use for untrusted-guest virtualization is quite small=2E
>
>Specifically, we would like to be able to enable the use of
>KVM with the imx8 development board machine types, but we don't
>want to commit ourselves to having to support those SoC models
>and device models as part of QEMU's security boundary:
>https://lore=2Ekernel=2Eorg/qemu-devel/20250629204851=2E1778-3-shentey@gm=
ail=2Ecom/
>
>This patch updates the security policy to explicitly list the
>machine types we consider to be useful for the "virtualization
>use case"=2E
>
>Signed-off-by: Peter Maydell <peter=2Emaydell@linaro=2Eorg>
>---
>changes v1->v2: updated the list:
> * remove isapc
> * remove ppc, mips, mips64 (no machines supported)
> * list pseries as only supported ppc64 machine
> * list virt as only supported riscv32, riscv64 machine
>
>I believe the list to now be correct, and I think we generally
>had some consensus about the idea on the v1 patch discussion, so
>this one is a non-RFC patch=2E

Thanks for clarifying this=2E

FWIW:
Reviewed-by: Bernhard Beschow <shentey@gmail=2Ecom>

>
>---
> docs/system/security=2Erst | 26 ++++++++++++++++++++++++++
> 1 file changed, 26 insertions(+)
>
>diff --git a/docs/system/security=2Erst b/docs/system/security=2Erst
>index f2092c8768b=2E=2E53992048e65 100644
>--- a/docs/system/security=2Erst
>+++ b/docs/system/security=2Erst
>@@ -35,6 +35,32 @@ malicious:
> Bugs affecting these entities are evaluated on whether they can cause da=
mage in
> real-world use cases and treated as security bugs if this is the case=2E
>=20
>+To be covered by this security support policy you must:
>+
>+- use a virtualization accelerator like KVM or HVF
>+- use one of the machine types listed below
>+
>+It may be possible to use other machine types with a virtualization
>+accelerator to provide improved performance with a trusted guest
>+workload, but any machine type not listed here should not be
>+considered to be providing guest isolation or security guarantees,
>+and falls under the "non-virtualization use case"=2E
>+
>+Supported machine types for the virtualization use case, by target archi=
tecture:
>+
>+aarch64
>+  ``virt``
>+i386, x86_64
>+  ``microvm``, ``xenfv``, ``xenpv``, ``xenpvh``, ``pc``, ``q35``
>+s390x
>+  ``s390-ccw-virtio``
>+loongarch64:
>+  ``virt``
>+ppc64:
>+  ``pseries``
>+riscv32, riscv64:
>+  ``virt``
>+
> Non-virtualization Use Case
> '''''''''''''''''''''''''''
>=20

