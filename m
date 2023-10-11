Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3688CD98E9
	for <qemu-riscv@archiver.kernel.org>; Wed, 11 Oct 2023 03:02:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qqPUD-0002Md-4o; Tue, 10 Oct 2023 23:02:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qqPU6-0002L4-4w; Tue, 10 Oct 2023 23:02:07 -0400
Received: from mail-vk1-xa35.google.com ([2607:f8b0:4864:20::a35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qqPU4-00012N-9W; Tue, 10 Oct 2023 23:02:05 -0400
Received: by mail-vk1-xa35.google.com with SMTP id
 71dfb90a1353d-49dc95be8c3so2153107e0c.0; 
 Tue, 10 Oct 2023 20:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696993323; x=1697598123; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dGoKaLQuqkayI4L3samTA52vpLxMCWUN5KMqAgtROvo=;
 b=T873IDZq04pYMfDb6jco88piMc7ZHAi4KOY8S0gVy5rLMpwB0nXIKgyMkDXLaQiXZ4
 sU4kTOwOSSRHgP76vivnI3XVKVjojHkijvAqAMAFKUl+pdAOfdIisWMYNzOav4D6Nf53
 1cfpAVMn8ydrJbF6TCkxmeJrQ5J14b521fYSIgxRJLEC0IfYsTw1o8ZQDupd8ExCZ4lF
 SSn/uaM58S0hCmZLh5QweQAkwFMlvCscJ/gyDdag8ZXsMpFBkDrXY2kHifStoeBLi0YX
 sg964j+RpAKXeqahYMvaoSIGYRhXxThYY7w8WuZx9FBpviZ2bgBey8IbaO6t9h/JzQsS
 K5yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696993323; x=1697598123;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dGoKaLQuqkayI4L3samTA52vpLxMCWUN5KMqAgtROvo=;
 b=f4SdiBIWWQsCoOcFngqvlUOyWCSDVOvUxUGfxwW710xB65vYTI30nVgISf77ZRmdoi
 w1ZMeGXiJ7iVJRv1YETeXGTQgVKkITxDdjUpvpcElV12fL0yb1mCZ60vlCSmcN0vXHLA
 w4qdchyvVD+/TiX1zOvG75HNMPnWm9viSs3DXhi25NNS8Hx8JJWmTsdN22AQh14qFxlt
 JLn1eFl4oArnFKbFN81/L8yTXr9/QGNKKiF4kQVhp2Qxq8cvHMQSddXfHS3N2F/0et+F
 hz86G+HLtZfJki8q0Hkg9XRxOrAD7ruJeqpNI5ntnbQUoBo1myXQVaUubSvChmFCijK3
 COTg==
X-Gm-Message-State: AOJu0YywT9YWsN95aj89aNLDxLXrQshV788FMpR1paZfgpv2V/2goGRU
 2LiuVqpefiPT6YQ/5BL9E12Fsge7gFM0aDgX1ds=
X-Google-Smtp-Source: AGHT+IGKoEu6r3WGIWpeZT/oaA4G1AYLcq01olJV0K8PI7RphCmbyNwlyy9s8khzQdvT5VTKS0fQBRvhyadgLTVYsGI=
X-Received: by 2002:a05:6122:2641:b0:496:a6cc:7ffe with SMTP id
 dr1-20020a056122264100b00496a6cc7ffemr12969522vkb.13.1696993322904; Tue, 10
 Oct 2023 20:02:02 -0700 (PDT)
MIME-Version: 1.0
References: <20231006132134.1135297-1-dbarboza@ventanamicro.com>
In-Reply-To: <20231006132134.1135297-1-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 11 Oct 2023 13:01:36 +1000
Message-ID: <CAKmqyKP=4kGpO=8D13iJw7pJSkD9CFary_DHt236+e1GFMAngA@mail.gmail.com>
Subject: Re: [PATCH v2 00/10] riscv: RVA22U64 profile support
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a35;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa35.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

On Sat, Oct 7, 2023 at 12:23=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Hi,
>
> Several design changes were made in this version after the reviews and
> feedback in the v1 [1]. The high-level summary is:
>
> - we'll no longer allow users to set profile flags for vendor CPUs. If
>   we're to adhere to the current policy of not allowing users to enable
>   extensions for vendor CPUs, the profile support would become a
>   glorified way of checking if the vendor CPU happens to support a
>   specific profile. If a future vendor CPU supports a profile the CPU
>   can declare it manually in its cpu_init() function, the flag will
>   still be set, but users can't change it;
>
> - disabling a profile will now disable all the mandatory extensions from
>   the CPU;

What happens if you enable one profile and disable a different one?

Alistair

>
> - the profile logic was moved to realize() time in a step we're calling
>   'commit profile'. This allows us to enable/disable profile extensions
>   after considering user input in other individual extensions. The
>   result is that we don't care about the order in which the profile flag
>   was set in comparison with other extensions in the command line, i.e.
>   the following lines are equal:
>
>   -cpu rv64,zicbom=3Dfalse,rva22u64=3Dtrue,Zifencei=3Dfalse
>
>   -cpu rv64,rva22u64=3Dtrue,zicbom=3Dfalse,Zifencei=3Dfalse
>
>   and they mean 'enable the rva22u64 profile while keeping zicbom and
>   Zifencei disabled'.
>
>
> Other minor changes were needed as result of these design changes. E.g.
> we're now having to track MISA extensions set by users (patch 7),
> something that we were doing only for multi-letter extensions.
>
> Changes from v1:
> - patch 6 from v1 ("target/riscv/kvm: add 'rva22u64' flag as unavailable"=
):
>     - moved up to patch 4
> - patch 5 from v1("target/riscv/tcg-cpu.c: enable profile support for ven=
dor CPUs"):
>     - dropped
> - patch 6 (new):
>   - add riscv_cpu_commit_profile()
> - patch 7 (new):
>   - add user choice hash for MISA extensions
> - patch 9 (new):
>   - handle MISA bits user choice when commiting profiles
> - patch 8 and 10 (new):
>   - helpers to avoid code repetition
> - v1 link: https://lore.kernel.org/qemu-riscv/20230926194951.183767-1-dba=
rboza@ventanamicro.com/
>
>
> Daniel Henrique Barboza (10):
>   target/riscv/cpu.c: add zicntr extension flag
>   target/riscv/cpu.c: add zihpm extension flag
>   target/riscv: add rva22u64 profile definition
>   target/riscv/kvm: add 'rva22u64' flag as unavailable
>   target/riscv/tcg: add user flag for profile support
>   target/riscv/tcg: commit profiles during realize()
>   target/riscv/tcg: add MISA user options hash
>   target/riscv/tcg: add riscv_cpu_write_misa_bit()
>   target/riscv/tcg: handle MISA bits on profile commit
>   target/riscv/tcg: add hash table insert helpers
>
>  target/riscv/cpu.c         |  29 +++++++
>  target/riscv/cpu.h         |  12 +++
>  target/riscv/cpu_cfg.h     |   2 +
>  target/riscv/kvm/kvm-cpu.c |   7 +-
>  target/riscv/tcg/tcg-cpu.c | 165 +++++++++++++++++++++++++++++++++----
>  5 files changed, 197 insertions(+), 18 deletions(-)
>
> --
> 2.41.0
>
>

