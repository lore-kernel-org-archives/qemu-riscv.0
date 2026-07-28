Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69614C53219
	for <qemu-riscv@archiver.kernel.org>; Tue, 28 Jul 2026 02:01:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1woX8Y-0008C5-Eb; Mon, 27 Jul 2026 22:01:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rahul@summations.net>)
 id 1woX8V-0008Be-CO
 for qemu-riscv@nongnu.org; Mon, 27 Jul 2026 22:01:39 -0400
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rahul@summations.net>)
 id 1woX8R-0003Dm-8T
 for qemu-riscv@nongnu.org; Mon, 27 Jul 2026 22:01:38 -0400
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-81e6f2ee60bso6788007b3.1
 for <qemu-riscv@nongnu.org>; Mon, 27 Jul 2026 19:01:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785204093; cv=none;
 d=google.com; s=arc-20260327;
 b=dvGvYywBflahMam8tXZqJ3RZMf00Fp72u9mCfXCEGm0g505Smr0JaTOyvj+MlnzfOi
 0/SZ8ht8k3LDZicM7OyCB0XGsJBvn5rVn6SX2fFnXOGqUi8IIx3huyiWajV1pvileol0
 aEKU1zmAL3eYruLCZWD8flwPujYvOJKAldNHzPeJNGuT088cTUpk4nJqUAPb+U/H8SRM
 //mCtgCdvD28r0+XxcUzx+gxZNPoNQsL95e9+fXTFyCLldaCGjMCAtTDPMeuMzVKR6wg
 S8O9a2o/LMa677SBKX6PrVt/E3x3vAeHVz9T32I4DbH8rDafvQ+w0aVDd3NVvakekJVR
 LqQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=rIS4gKkPfjEPvIYr6ATqDZOWcS8KoVPF56KZr18KIoY=;
 fh=NwBIJmi7ruxu12dsCXcocAmg0hGys1zZT+4rEnZD3u8=;
 b=BBvSKjKN/llc5DpD1m+mtFKkMqk3Rm+9XxuIUOYAKsbm/T6nHxm8uRy+Qk2q+gb+iX
 5pOywYZMk2P+bdqzEH0v0jgdEoiq+VLC0a6KTD0Db5hV/77dNcd6lr9g4UK2Wqg154f8
 IFV4fIy4lYY1GZvd/+e5xjAxtEmy8KiqhNT/KTpXosZih2oejoJ0biy7CAhCZ8PZ5jRO
 KJuWROSiahVy4+XQhXNOi2wbizL1vzNlblWtbzMEzzkiuWF6u5BJj1/LU+BmAdbHDysr
 6p93SrluvAnXdjxso3dgfRMh/cpSJiQHHKl6NBCWJ5U52H8iKFfM8mBqaajmQJ/KznoI
 43bg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=summations-net.20251104.gappssmtp.com; s=20251104; t=1785204093; x=1785808893;
 darn=nongnu.org; 
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=rIS4gKkPfjEPvIYr6ATqDZOWcS8KoVPF56KZr18KIoY=;
 b=AW1+P0cktGSDwwVMRGtU4km2CvFz2r5jNFxDc9OXhwcWysoeUTjm7VWM0qKXgIOMFl
 eLjp6MnvpIlW4/A66ZravK80TBaUolv9ayP7Ii5np589H0vPV2hpfcCXw/Vdyjm4zLCP
 VlCECxcoMM1Re5MJdAmTYTTlgJpoxai9khKj4CUWKts4Y+QWfdBOZSV2NoeKBd748SSw
 KsLhCYr6oFcnxo9L6rAv27/xawcH5+Gz6szuqSJvLRqFeUBzC6wCVwQM7z1zkEiiYrkL
 Qpjb3PoUpYi5qHIUgSK2a5Gv0O1OC7g82QtBldfM9vXDkP10BcsSrrILudRZ6vzhZcJl
 0U9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785204093; x=1785808893;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=rIS4gKkPfjEPvIYr6ATqDZOWcS8KoVPF56KZr18KIoY=;
 b=jic1dmaPpmQRg0DqMiRBWFNcIPHWloajU08QQkR/f8gddRsg8G7BbF4pCibrLECyQi
 ksCnTCV8CoNopdiQYR2RMKJQjvbx1wi/hrHhd6qKPQj1lDmyfSqXIa+KSm1nBGSrPDt0
 w5OHLLdsScp0sU5Pu/vv+TUVs3vHIAJoVUbZ+QSFaTQ+OjpfHZBlMwM17GwvJBOqd12D
 SO8zYsJmOstAe9UVQmN07wJAxOX8QqtEDQp/8LAIN5LTqkUYGuBhBMcaEuaS15boqgIw
 MvjYn4VfbTzYFBofb6WfAHU0h6Utobmf7uyX5IARVExj18WLy9NaKcQhvOEnDjRE5VKW
 dCmA==
X-Forwarded-Encrypted: i=1;
 AHgh+Rq82m1kMMqxUVbTYdlLCAgYgyaE9YQ7fWxlBEM/Vca1mdyAPyu9pSxmntn1SgH9q/iDh8cxMZFUOqqW@nongnu.org
X-Gm-Message-State: AOJu0YzZvdCvuWvbxdRuLVepYwsunINS8KlJz+YLzS/5ZrqIEke7SP5W
 d55T87XH11RDidKhQlZXQCVIjTeBDDntqa0WylXOMy9PCmRlzTq+9maWwDbRYICawDV7xqYgwkz
 t8xFp4u0Lkohy9oopHKgEIxMi+Aqu4V9tNIqdWJKZoO4=
X-Gm-Gg: AR+sD10c0ah0sv4Pm0K1beB1uP484x+eXCNZwQaDvnMZE34lZBNu7zRdw2SXj2V1EDY
 SC96fSYLDe+dsHzn4i9K7q2d+uiXuZjfj6sRmQMCYoUOLhKoGITPf6+qq7KXz7YZPzUbVU0Bi+t
 3dSUKX60n6ZmrZcR9IK+uMYF4drPZYrkf3uGoybudRLwHD9pcEcsYpc8apDb+T0aT5Rv9wmkWBM
 Sc8tVePwfJFdx8UpAGluwyQo5WnCo1sztVHbik3JyUa7TJZKjvs5v7g7V20TbtjR9Ge3wfcBheA
 YjqZ9q7/3+3qxALTFn9QtQnWkWJprp/HGmVLBfAjD+ehpRJ+Eq0=
X-Received: by 2002:a05:690c:48c1:b0:81e:fc6c:452c with SMTP id
 00721157ae682-81f99235319mr1460367b3.9.1785204093024; Mon, 27 Jul 2026
 19:01:33 -0700 (PDT)
MIME-Version: 1.0
References: <20260723200325.24969-1-zhiwei_liu@linux.alibaba.com>
In-Reply-To: <20260723200325.24969-1-zhiwei_liu@linux.alibaba.com>
Date: Tue, 28 Jul 2026 07:31:21 +0530
X-Gm-Features: AUfX_mzbpwBpN8_BT3IEVhDTA6jNnq1su5DhycjG-OZOMbUi2WDJhSb7cHNgOgY
Message-ID: <CABdD5x=TsT+viCs_D-JDs3tttw4u8Pri0VpQpM24KB-ezKFn+Q@mail.gmail.com>
Subject: Re: [PATCH v8 00/11] target/riscv: Implement Smsdid and Smmpt
 extension
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Cc: qemu-devel@nongnu.org, palmer@dabbelt.com, alistair.francis@wdc.com, 
 daniel.barboza@oss.qualcomm.com, chao.liu.zevorn@gmail.com, 
 liwei1518@gmail.com, qemu-riscv@nongnu.org, xiangyi.zeng@linux.alibaba.com, 
 cxx194832@alibaba-inc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112f;
 envelope-from=rahul@summations.net; helo=mail-yw1-x112f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Reply-to:  Rahul Pathak <rahul@summations.net>
From:  Rahul Pathak via <qemu-riscv@nongnu.org>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Fri, Jul 24, 2026 at 1:33=E2=80=AFAM LIU Zhiwei <zhiwei_liu@linux.alibab=
a.com> wrote:
>
> This patch set introduces support for the RISC-V Smsdid and Smmpt
> (Supervisor Domain Identifier and Memory Protection Table) extensions
> v0.4.9(https://github.com/riscv/riscv-smmtt/releases/tag/v0.4.9).
> Smmpt provides a hardware mechanism for fine-grained memory protection,
> checked after address translation, which is particularly useful for
> supervisor-level sandboxing and security monitoring.
>
> The rfc patch set:
> https://mail.gnu.org/archive/html/qemu-riscv/2025-09/msg00216.html
>
> Rahul Pathak is working on SMMPT OpenSBI support -
> https://lists.infradead.org/pipermail/opensbi/2026-July/010235.html
>
> based on his QEMU SMMPT branch -
> https://github.com/pathakraul/qemu/tree/rpathak_smmpt_v1
>
> As we all agree -
> https://patchew.org/QEMU/20260715145016.17369-1-zhiwei._5Fliu@linux.aliba=
ba.com/
> , we will collaborate on this work and not duplicate efforts. Rahul will
> focus on OpenSBI upstream and I will update the QEMU patch set to v8.
>
> Xiangyi will review the OpenSBI SMMPT patch set and may collaborate to
> upstream the other parts, such as SMSDIA and IOMPT.
>
> v7->v8:
>     1. Update the mfence.pa and minval.pa instruction encodings to match =
the
>        upstream riscv-opcodes definition
>        (https://github.com/riscv/riscv-opcodes/pull/389/): mfence.pa now =
uses
>        funct7=3D0b0011001 and minval.pa uses funct7=3D0b0011011. The deco=
der,
>        disassembler and the system test are updated accordingly.

I have posted the updated OpenSBI SMSDID+SMMPT V2 series
which aligns with this series version

https://lists.infradead.org/pipermail/opensbi/2026-July/010288.html

