Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 451B1CA5FD4
	for <qemu-riscv@archiver.kernel.org>; Fri,  2 Oct 2026 03:10:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xCTfU-0004sV-DG; Thu, 01 Oct 2026 23:10:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xCTfS-0004rq-QR
 for qemu-riscv@nongnu.org; Thu, 01 Oct 2026 23:10:38 -0400
Received: from mail-ed2-x0e.google.com ([2a00:1450:4864:33::e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xCTfR-0004Np-Bn
 for qemu-riscv@nongnu.org; Thu, 01 Oct 2026 23:10:38 -0400
Received: by mail-ed2-x0e.google.com with SMTP id
 4fb4d7f45d1cf-6aae1f2cedfso9598739a12.3
 for <qemu-riscv@nongnu.org>; Thu, 01 Oct 2026 20:10:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790910635; cv=none;
 d=google.com; s=arc-20260327;
 b=r0bRAPcKDa0upSFMFVB6Bw7MVXKdWsRinuh6WObP2duiPSXcf3HwEc3yTRH2yRHra/
 13Cdzb0l3CA6YxzxYRZVFIoeJMtvlMja1rbhd7c3lmljqq0L+wo8FJZvAUVPQTlBNsPV
 v70ZgfvGKuDp4R6CXPr3RwIJHQHTpz1BF9Gqn/Vn2EER0g3DBcXY2NtOz2cOerxilVOu
 idg/YzRQNIGdKIMTtqKZNaDZL+ovSsJYlN1yG+iHEqfp5UX5u9by5MobZVNprthNkSuN
 2baVVrg80kmfWcCgygS9V0kbzc+AsqIS/lW+3/pFMF5MVn5X76PPAvhIIK1zgNUC8wJE
 CG0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:dkim-signature;
 bh=O2qwL9HHfLSa8iidf6iXkOt32mrRAdwATltII/NaBwI=;
 fh=L/ikmJUZYxPYOQeboHjqPJHvVdXlHoEy7DlB1AkMT2M=;
 b=s9mw6V22lDnr9AmANayO7XVtM4dGZo0KVgzM0nHJDZ+4nAY1uD3dmTo4HmFbchKhqS
 7MvhasVUbi2eqt4xictRO1k2yAHf0obllhXp6zKL6zD5tPcmZBW2FdY5ZzMdW7428kBX
 fJtfALb1685ABqbRfK8jhdZWie4X0HXoPAGRs3bi2VtJ0dt5yTrg+0Q/6vR2n4NV+yVx
 Fe4puWgBdwJ/C0OnCW+1GZfK4Atkh+u875e5ALuZFpd8XY1m2zOFxPGH6m3esiyUu4ET
 GpDqycOKkte6cRetlxfu4q3aaB/OUPpzAvU8Uvd6PPgLbfVYOe04eA1tXd5qZGy/Xyc5
 Z7MQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790910635; x=1791515435; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=O2qwL9HHfLSa8iidf6iXkOt32mrRAdwATltII/NaBwI=;
 b=hT2oSSR96rJIknSbB8YtZeMnMivA3E1IoesMW3S3evXZhD0IC753Ex7rNUe59YY5Z1
 WKQCkFomIjXwVV2gQ4kE65GhyFPvjVyVT3o9+tgI5WTYg0UYFTs6VtsiXoikfNHsaass
 4P9AeWtHH2aQjdE4R727f8VoCxlvrecHxcxRVNnQ0vSX9gIIhhevYwAJrvLoLHlfyGdY
 O9EKDdc9pATWcmrDtpb/6x6urD1L4uLeM1TTuMqnFSdS4HFcmcfttFQQnPbSrxoT1XA7
 y3GJBpf9CTacXmNASBk8ZYAHLv9Nu/NWaicV8IDv/WmSZVTdnVyYFaFtnt7R1xnd2Fsf
 81rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790910635; x=1791515435;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=O2qwL9HHfLSa8iidf6iXkOt32mrRAdwATltII/NaBwI=;
 b=gWbTpnG57QDCgqoIE0esCilvLmXsNvGEQUyBELwx/RMiKkfA6cs7zPjKiqKyKk12p2
 2ZX2aA/JP929Br+Ds909IuWVMmsNQE6Xchca7FaMkhuDnkVIeJXnOFWzvTHZOoVQoUPX
 SXxMZIYk/LjnFP5vVPzz1omxf4mtqM32PuVOS8Lty4+hFI37PCi5csPcTEykUM//MLOh
 jbMCSH1dyUTN4xc0kuH3Wb+7gA9QJMcpDTg7TMDW+wmTdUIJhh+/GiqPA2rqqxC3Wo3c
 AfmjgbjXLNmS/PSPI1447f3Sy6SFRujlahA+Ew5TKizC8kwKq7APbS5R5AadvRIQjs3U
 /36Q==
X-Forwarded-Encrypted: i=1;
 AKwUvByqMztbAw0oxg6tcV3l6dwWkwjyMbnOzXSYZ/G4s5b+pH56lHdko4dtbSvdufaiVxXSChCqEf4qzaex@nongnu.org
X-Gm-Message-State: AFq9FYJIO5+nzWuc7h628z9V8ThNV0KokasxQQFfmbJ+SuusZtLWmENu
 vLUWyb5akRpXIyw5LJZ7c0aXTqPzzHjDw3FOs8dDGs7mW3iILTvum1PEepAsX3uGSRpLdMTTeGE
 zjGHZL7otthL3u/aCjSx+1OXJNsXedhk=
X-Gm-Gg: AYBFou1bFaESuvHuzNNYFAO6ssHNfYD4TapOngtlNk1BeAY1XEOBIXUVYII4JxFO0Tm
 U3Wtwm7T1XS2uk8JXUh0xh3ZNMeQScDEvkwbB83tn7Woz6+mXbYpdDxQtYDabDG5m5pE3cOMFNN
 P95bOyNBtz6usHKxfDoj4u28rHgaGK4l2xaZQOfqS+3oXHTlVbQRkEgWo8uLD4LX/aFAOumZaJb
 thlKhY240Qn/+FVHCifgNmd8zKWdpLuZQd9VaTbb537MLW7e5URmTlnWhk97c9fwxoKycphn7jL
 UZCNoAMiYa6dFnrR+YwduUy6VV73tS2HyWcZGUOUoY8zn41FWItdkQ4ozwnbaiEu1Q==
X-Received: by 2002:a05:6402:241a:b0:6ab:81e:e827 with SMTP id
 4fb4d7f45d1cf-6af9e342c7amr588658a12.43.1790910635387; Thu, 01 Oct 2026
 20:10:35 -0700 (PDT)
MIME-Version: 1.0
References: <82250296-78bc-4345-9e57-1fcac485d18a@oss.qualcomm.com>
 <CAE2XoE_+nhj58M9_yx6wf532qCSVcERpTw7F4AU7PXN7prhpzg@mail.gmail.com>
 <74853ef8-7315-466a-99ac-41c8182f9b13@oss.qualcomm.com>
 <ar4TQtKqfXX5Ul9O@redhat.com>
 <CAE2XoE8q3LYJ-JCTbRBk4iPdUQdRE8zzmOgiZ=HEXDL78iw8UQ@mail.gmail.com>
 <26b0d44d-0322-4ceb-a47b-747fc52c61b7@oss.qualcomm.com>
 <CAE2XoE8VyCpPCqRVFArBn_dDsyMw8vrSJxWMhKq17btZvO2n6A@mail.gmail.com>
 <b02db9e2-b348-4011-a98d-122e9d9f17e5@oss.qualcomm.com>
 <ar6a_uDw9OeLng6c@redhat.com>
 <6bf4dad5-4fa2-4df1-b6b8-d594dbd3842c@oss.qualcomm.com>
 <ar6lw3jAcnVej6vK@redhat.com>
 <557262df-b8e7-49b5-a245-ae46b8885b30@oss.qualcomm.com>
In-Reply-To: <557262df-b8e7-49b5-a245-ae46b8885b30@oss.qualcomm.com>
From: Yonggang Luo <luoyonggang@gmail.com>
Date: Fri, 2 Oct 2026 11:10:23 +0800
X-Gm-Features: AclHuK-V0xU1FhvPsvL3Y6lfOZX2d6Sg1XJ8ZXrABF_10hAEPt_ryix_uYLfPvs
Message-ID: <CAE2XoE8mmz9jjhEgJUYZ3Symk==RJTSO6uVy_2haxcuFkunmHA@mail.gmail.com>
Subject: Re: [PATCH v3 01/10] machine: allow -M name to differ from QOM type
To: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
 qemu-devel@nongnu.org, Chao Liu <chao.liu@processmission.com>, 
 Eric Blake <eblake@redhat.com>, qemu-arm@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>, 
 Alistair Francis <alistair.francis@wdc.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>, 
 Stafford Horne <shorne@gmail.com>, Peter Maydell <peter.maydell@linaro.org>, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Fabiano Rosas <farosas@suse.de>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 qemu-riscv@nongnu.org, 
 Laurent Vivier <lvivier@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Song Gao <17746591750@163.com>, 
 Philippe Mathieu-Daude <philmd@mailo.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Laurent Vivier <laurent@vivier.eu>, Weiwei Li <liwei1518@gmail.com>,
 Zhao Liu <zhao1.liu@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:33::e;
 envelope-from=luoyonggang@gmail.com; helo=mail-ed2-x0e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Fri, Oct 2, 2026 at 2:56=E2=80=AFAM Pierrick Bouvier
<pierrick.bouvier@oss.qualcomm.com> wrote:
>
> So, for existing binary: -M virt works as before.
>
> For new multi binary:
> $ qemu-system -M virt:
> Multiple machines were found, select one among:
> - aarch64-virt
> - riscv64-virt


This is what I implemented:
 ./qemu-system -M virt
qemu-system: unsupported machine type: "virt" for target "none"
Available for targets: aarch64, arm


--=20
         =E6=AD=A4=E8=87=B4
=E7=A4=BC
=E7=BD=97=E5=8B=87=E5=88=9A
Yours
    sincerely,
Yonggang Luo

