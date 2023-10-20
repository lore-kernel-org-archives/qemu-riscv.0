Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE06AC001DF
	for <qemu-riscv@archiver.kernel.org>; Fri, 20 Oct 2023 17:41:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qttU6-0001U1-TC; Fri, 20 Oct 2023 13:40:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qttU4-0001Qc-Sf
 for qemu-riscv@nongnu.org; Fri, 20 Oct 2023 13:40:28 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qttTy-0002if-Co
 for qemu-riscv@nongnu.org; Fri, 20 Oct 2023 13:40:28 -0400
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-53e84912038so1618931a12.1
 for <qemu-riscv@nongnu.org>; Fri, 20 Oct 2023 10:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697823620; x=1698428420; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5ecj4k7fUCeUFhk806jIEjdUHq1mY981ro5iqfcu8WI=;
 b=YV4g0p8Yl5+ORuSQ5fRluzOrsJgh7zFCiCqaokN7LGV+kRj1b7Rez7Xfox5QWvmbF2
 7ZE3pJ6usCKePRor1EXW6xZLmruB768lI9s/gXMJtRc+9dGRpZ8XsRqs0vhfa2TRThZe
 zIPiQv9Xdu9hqH/GUVqkJfcQsObGPTiquCaF9YG9C3MF9nGy0FWQjvjWjLvSKfPEsse6
 ovz0Va93lHrGGgUwJNhodbsxcd2VMiEyaqY1L7w2NGvuxBfv8ORUuZaIvooj33qIcjQX
 J4SGoKgdrQ1cb+KQeEizXgQ26VoxgUzaBjJnEH9T8s9+S7IbJdfNWEqmkiC5gWfhVOJP
 POhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697823620; x=1698428420;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5ecj4k7fUCeUFhk806jIEjdUHq1mY981ro5iqfcu8WI=;
 b=mt/gUJr0UJjszU4Of/gOAQsYD44moeVmsqiFhl1yqOCz0dBRaRmxfkZxY3Btz07+qG
 24nv8AjmXmBXviIO/FcfTV46z68PuKqyG5xi0nWCRWhTHSotc9QUN30DOSyJJGiIIl+K
 5ZTgS3N2YPKVmQd7gfcM7k9fsc1r6T3KhPF1ffWphAwcLakbp0q6f7lVInVGbz65Chzz
 io/5o0UWMEqaqvup31S+sNUDegLcJSQMZJl/pcq4QjjxH6Jk9apNexgKX058LN0gurPx
 ITF4TkOjPqZXZgxp7WZLnQJefI9uB/LdIhtIuhHsA8E2odJqqvayV6NnBfbRMDvXSoL3
 1Rrw==
X-Gm-Message-State: AOJu0YyZKhTIACoknE1w2EA8a4kjErcOclIXEBqjgwxyKc4GLkYzkb6F
 pcrfJb5PjWPI0MiopDYetDCbpjcI7PtDa9ZGIdmi8w==
X-Google-Smtp-Source: AGHT+IG5XeIAflMpcqUls1q2bcmzj8M2720/NorBsJ559jux9veJWCY8EgwkFHN3rl7l1ptkNMF9o7lWjVanb/aRjds=
X-Received: by 2002:a05:6402:26cd:b0:53d:d913:d3cb with SMTP id
 x13-20020a05640226cd00b0053dd913d3cbmr2077965edd.28.1697823620612; Fri, 20
 Oct 2023 10:40:20 -0700 (PDT)
MIME-Version: 1.0
References: <20231020163643.86105-1-philmd@linaro.org>
 <20231020163643.86105-2-philmd@linaro.org>
 <CAFEAcA9FT+QMyQSLCeLjd7tEfaoS9JazmkYWQE++s1AmF7Nfvw@mail.gmail.com>
 <56646980-d38c-d844-1ee6-80453d092172@linaro.org>
In-Reply-To: <56646980-d38c-d844-1ee6-80453d092172@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 20 Oct 2023 18:40:09 +0100
Message-ID: <CAFEAcA-SwdO9qo=dFpbwOuEo2fu_WFxD7L5BipVnuvk99cz=Hg@mail.gmail.com>
Subject: Re: [RFC PATCH 01/19] cpus: Add argument to qemu_get_cpu() to filter
 CPUs by QOM type
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 Alistair Francis <alistair.francis@wdc.com>, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-ppc@nongnu.org, 
 Eduardo Habkost <eduardo@habkost.net>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-s390x@nongnu.org, 
 Zhao Liu <zhao1.liu@intel.com>, Andrey Smirnov <andrew.smirnov@gmail.com>, 
 Radoslaw Biernacki <rad@semihalf.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>, 
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, 
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>, 
 Alistair Francis <alistair@alistair23.me>,
 David Woodhouse <dwmw2@infradead.org>, 
 Paul Durrant <paul@xen.org>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>, 
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Song Gao <gaosong@loongson.cn>, 
 Thomas Huth <huth@tuxfamily.org>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Halil Pasic <pasic@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>, 
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>, 
 Yanan Wang <wangyanan55@huawei.com>,
 "Dr. David Alan Gilbert" <dave@treblig.org>, 
 Marcelo Tosatti <mtosatti@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Fri, 20 Oct 2023 at 18:29, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> Hi Peter,
>
> On 20/10/23 19:14, Peter Maydell wrote:
> > So overall there are some places where figuring out the right
> > replacement for qemu_get_cpu() is tricky, and some places where
> > it's probably fairly straightforward but just an annoying
> > amount of extra code to write, and some places where we don't
> > care because we know the board model is not heterogenous.
> > But I don't think "filter by CPU architecture type" is usually
> > going to be what we want.
>
> Thank for these feedbacks. I agree the correct way to fix that
> is a tedious case by case audit, most often using link properties.
>
> "we know the board model is not heterogeneous" but we want to
> link such board/model altogether in a single binary, using common
> APIs.

This seems to me like a different thing -- just compiling
the different boards into one binary. That should be fine:
in this single-binary qemu, if you tell it -M foo that's an arm
board then qemu_get_cpu() returns the CPUs that are created,
and those will all be Arm. If you tell it -M bar that's a PPC
board, then qemu_get_cpu() will return the CPUs that are
created, and those will all be PPC. The assumptions of the
code that's currently calling qemu_get_cpu() or using the
first_cpu global won't be broken. It shouldn't need us to
change a lot of code that we don't intend to try to use in a
heterogenous-at-runtime setup.

thanks
-- PMM

