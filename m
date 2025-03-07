Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84A1BC19F32
	for <qemu-riscv@archiver.kernel.org>; Fri,  7 Mar 2025 03:24:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tqOJQ-0007ir-Du; Thu, 06 Mar 2025 22:23:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1tqOJO-0007hy-6G
 for qemu-riscv@nongnu.org; Thu, 06 Mar 2025 22:23:46 -0500
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1tqOJL-0002f0-KQ
 for qemu-riscv@nongnu.org; Thu, 06 Mar 2025 22:23:45 -0500
Received: by mail-yb1-xb2c.google.com with SMTP id
 3f1490d57ef6-e5dc299deb4so1213628276.1
 for <qemu-riscv@nongnu.org>; Thu, 06 Mar 2025 19:23:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1741317821; x=1741922621;
 darn=nongnu.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fuiEK/WSSOVigEAARmIocqRSaN77iMaB82+Lcmjelzc=;
 b=TCR6/OLlUdfNsquTrYoD7UyWfhG7KfkP6XV06fbXDHNo+qeSGIxe5a6As7tTqyFtl8
 Sceg4YUUHAW0WITsZmyW+Xrnm8ANksehA9I3DGrKk5MBd0p5NE7mKpNige812M19S0i5
 dEz56MroJxEe+LEvG2BkNf+ykUrbmiWxA71cUYCMDGe1jHylygFGxcfw2F64PBCrEtsQ
 93iYv4XRusUpWXpVUL+G4SnMfYTNUf61tur2Wuyp1BJdzeIf8+dnvDn3WlZ5Wxgxg8yR
 PPClBWyNtfvAVZkBFlkfhnN6re1FcqwPW0YviuvJq0wla20nBVUEyK3w2gePw55Gf3sx
 jMKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741317821; x=1741922621;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fuiEK/WSSOVigEAARmIocqRSaN77iMaB82+Lcmjelzc=;
 b=IAwlld6YMcwIJ6dziavU0p7qeiYNVsc7YLzWaBOo5H9Ry6EEegfCeR6R3aHkkRTrZI
 prSLtagx3+d04tIi/EROvCHYhIXTv4el/K1ERgNYjxJdbJNpndNKsaR8j05PF7uouUeo
 ZMb1nNItUoE//LMKIOysqzPLRACYHMp5wrU3uvsYepbxBcPi1FccxYG/FTXVuoQqh63e
 D3fV4IDZhonTfgtqkkotpoKNaqVq7uVIB88slepY6Hqe1r5YzRm1PUE9k+Z13wajQlzA
 mbk4SC2AsCnhtO7y7baAiWHBJcpO42Y55jcDxv0Q9SBgyfncsZB5teLNivbNkBISErD5
 pegw==
X-Gm-Message-State: AOJu0YxL1k8Lgi/5HrzKuIma+155FCra4Vsh0+8IoWE4HHjCHArwETqY
 YFnCr/3KYY8r1y7GNr7ni1LzYW9GMM0PzfNI/2O5Uo/u2G2Y8q6Nbjhf9fnxupcSrjU8yVgiPBV
 /AK5lhC7YBloR0Dr9JpfYGUwCevP3PO4sCjMcjA==
X-Gm-Gg: ASbGncvx0kWdSrW1egWCDxy6XJXUMStpndJBpMqsl9SyKgHObKOkZd4erMYrP6tfULx
 WWf0UQkmounnmCQ75wGMure0IpRr0PAic7gvDhN3j6vwiGC3sz67vj0nKGRUELIdZk3vaIAIHBb
 RZvmsrsCssj3KkozNQJfcb4NI=
X-Google-Smtp-Source: AGHT+IFw1SSrNB8WIjPKAh2lIEku2XQuaoW1JIP5hAtyXXx5KMgPyxqzjRzr1+wpKqZftyfgf/PMuYhSxJxCEDnlLBI=
X-Received: by 2002:a05:6902:330c:b0:e5b:1c0a:6cac with SMTP id
 3f1490d57ef6-e635c1d81f6mr2224860276.38.1741317820817; Thu, 06 Mar 2025
 19:23:40 -0800 (PST)
MIME-Version: 1.0
References: <20250306064636.452396-1-debug@rivosinc.com>
 <20250306064636.452396-2-debug@rivosinc.com>
 <CAKmqyKOHrYSMVNUo9B6fcG7921eMeuioXw0KK8rD=NS8HEqbTQ@mail.gmail.com>
In-Reply-To: <CAKmqyKOHrYSMVNUo9B6fcG7921eMeuioXw0KK8rD=NS8HEqbTQ@mail.gmail.com>
From: Deepak Gupta <debug@rivosinc.com>
Date: Thu, 6 Mar 2025 19:23:28 -0800
X-Gm-Features: AQ5f1JolP-ZYT18RnjLIxpCJqkUa6x5pexpwGZuDYCBKOafxFsrozu_b7EsOjuA
Message-ID: <CAKC1njQ-ziJFAFfSiXwY=fB17ih3dMPCra-PWxHkFSZ7OTaz7A@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] target/riscv: fixes a bug against `ssamoswap`
 behavior in M-mode
To: Alistair Francis <alistair23@gmail.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, palmer@dabbelt.com, 
 alistair.francis@wdc.com, bmeng.cn@gmail.com, liwei1518@gmail.com, 
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com, 
 Ved Shanbhogue <ved@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2c;
 envelope-from=debug@rivosinc.com; helo=mail-yb1-xb2c.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Thu, Mar 6, 2025 at 6:05=E2=80=AFPM Alistair Francis <alistair23@gmail.c=
om> wrote:
>
> On Thu, Mar 6, 2025 at 4:47=E2=80=AFPM Deepak Gupta <debug@rivosinc.com> =
wrote:
> >
> > Commit f06bfe3dc38c ("target/riscv: implement zicfiss instructions") ad=
ds
> > `ssamoswap` instruction. `ssamoswap` takes the code-point from existing
<... snipped...>
> > Fixes: f06bfe3dc38c ("target/riscv: implement zicfiss instructions")
> >
> > Reported-by: Ved Shanbhogue <ved@rivosinc.com>
> > Signed-off-by: Deepak Gupta <debug@rivosinc.com>
>
> Thanks!
>
> Applied to riscv-to-apply.next

Thanks a lot.

>
> Please use a cover letter for a multi-patch series in the future
>

Noted.

