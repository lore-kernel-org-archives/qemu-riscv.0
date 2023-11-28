Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C620C4167B
	for <qemu-riscv@archiver.kernel.org>; Tue, 28 Nov 2023 15:51:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r80Mi-0005yf-Ep; Tue, 28 Nov 2023 10:51:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1r80Mg-0005xm-Fn
 for qemu-riscv@nongnu.org; Tue, 28 Nov 2023 10:51:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1r80Md-0007lX-0g
 for qemu-riscv@nongnu.org; Tue, 28 Nov 2023 10:51:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1701186665;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a7TaJ1fftDKYLjchnWgAH2T0JUqr3+5SdVc0/8Z4EIs=;
 b=g2FtqkKmMfVEwbeSWHRRRFzal+8CFPa2CspgBH++J3x8CMkl3YJhJAu3jTltdvmMAhlQoV
 cCu4wHUH7AEK3M9JNtwW1VAWHP6YrsgUpJwmRWvR3snPkgfqukHsMQGd1PM4QcgGLKOfJk
 gk7+Ls3r4CfWftxRqM3+qX9E775u0lI=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-137-Ov-UI5b_Nkib6FeVyrNUhQ-1; Tue, 28 Nov 2023 10:51:04 -0500
X-MC-Unique: Ov-UI5b_Nkib6FeVyrNUhQ-1
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-a0d66bf14d9so231903366b.0
 for <qemu-riscv@nongnu.org>; Tue, 28 Nov 2023 07:51:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701186663; x=1701791463;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a7TaJ1fftDKYLjchnWgAH2T0JUqr3+5SdVc0/8Z4EIs=;
 b=l62C8EobBWP2Ma51ESylzyqZT9yG0qWeV1wozI2LGgWpZaGfJ+x2WqM4lbx2a5lg9Z
 uaBVSgpIJGMEbuGWIsLr2dObyhnN5mYxoJYXh8A2jy95ic4Y+BVZxJIwmnP2DdPWTI64
 FQBVq0cQMyV41+7oJDQ7+HjcO6pBd1dgLQ4NhUK6I3dLlrhkKkEIzg655GVdzK8OqRF/
 YuGCkV+lBMznmYDevzKvbNNuHOm71LX6xwRoxd666sjTUBhTUI1rDRP/KpQR87n5IY3a
 As6deEpFGDSf9pdcBkzSzEOC0v7u+34bUaO4sN8Ab7Z2ZHJJGJOTl7r7YEsDu3bS6/xK
 PApQ==
X-Gm-Message-State: AOJu0YwmPUOwcmmiLFapzGwbr+H9rvsri/tb1UqQdEJLtjSySqTwwpJa
 F1MDy4txxz9+6+z2tWu+/DfK1hA4PiFzZaWTo73+yQgsVbJ7eUBhBFy9HaHpqljNAY/lAcOXMgv
 6lSlDtJhJncyFHe0=
X-Received: by 2002:a17:906:eb08:b0:9fd:5708:cefd with SMTP id
 mb8-20020a170906eb0800b009fd5708cefdmr10544132ejb.76.1701186662906; 
 Tue, 28 Nov 2023 07:51:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEb0zDYECHV55FNXL39hwvytpLNp50WfqgLZLPXS6enMvDKVaq+r28r7KsslsxMoD0RVFay7w==
X-Received: by 2002:a17:906:eb08:b0:9fd:5708:cefd with SMTP id
 mb8-20020a170906eb0800b009fd5708cefdmr10544093ejb.76.1701186662648; 
 Tue, 28 Nov 2023 07:51:02 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 cd19-20020a170906b35300b009ff783d892esm7045461ejb.146.2023.11.28.07.51.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Nov 2023 07:51:02 -0800 (PST)
Date: Tue, 28 Nov 2023 16:50:59 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini
 <pbonzini@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>, David Hildenbrand
 <david@redhat.com>, Peter Xu <peterx@redhat.com>, Anton Johansson
 <anjo@rev.ng>, Peter Maydell <peter.maydell@linaro.org>,
 kvm@vger.kernel.org, Marek Vasut <marex@denx.de>, David Gibson
 <david@gibson.dropbear.id.au>, Brian Cain <bcain@quicinc.com>, Yoshinori
 Sato <ysato@users.sourceforge.jp>, "Edgar E . Iglesias"
 <edgar.iglesias@gmail.com>, Claudio Fontana <cfontana@suse.de>, Daniel
 Henrique Barboza <dbarboza@ventanamicro.com>, Artyom Tarasenko
 <atar4qemu@gmail.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-ppc@nongnu.org, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Aurelien
 Jarno <aurelien@aurel32.net>, Ilya Leoshkevich <iii@linux.ibm.com>, Daniel
 Henrique Barboza <danielhb413@gmail.com>, Bastian Koppelmann
 <kbastian@mail.uni-paderborn.de>, =?UTF-8?B?Q8OpZHJpYw==?= Le Goater
 <clg@kaod.org>, Alistair Francis <alistair.francis@wdc.com>, Alessandro Di
 Federico <ale@rev.ng>, Song Gao <gaosong@loongson.cn>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, Chris Wulff <crwulff@gmail.com>, "Michael S.
 Tsirkin" <mst@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 Fabiano Rosas <farosas@suse.de>, qemu-s390x@nongnu.org, Yanan Wang
 <wangyanan55@huawei.com>, Luc Michel <luc@lmichel.fr>, Weiwei Li
 <liweiwei@iscas.ac.cn>, Bin Meng <bin.meng@windriver.com>, Stafford Horne
 <shorne@gmail.com>, Xiaojuan Yang <yangxiaojuan@loongson.cn>, "Daniel P .
 Berrange" <berrange@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>, Richard
 Henderson <richard.henderson@linaro.org>, Aleksandar Rikalo
 <aleksandar.rikalo@syrmia.com>, Bernhard Beschow <shentey@gmail.com>, Mark
 Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-riscv@nongnu.org, Alex
 =?UTF-8?B?QmVubsOpZQ==?= <alex.bennee@linaro.org>, Nicholas Piggin
 <npiggin@gmail.com>, Greg Kurz <groug@kaod.org>, Michael Rolnik
 <mrolnik@gmail.com>, Eduardo Habkost <eduardo@habkost.net>, Markus
 Armbruster <armbru@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH 03/22] target/i386/kvm: Correct comment in
 kvm_cpu_realize()
Message-ID: <20231128165059.0d991a0c@imammedo.users.ipa.redhat.com>
In-Reply-To: <20230918160257.30127-4-philmd@linaro.org>
References: <20230918160257.30127-1-philmd@linaro.org>
 <20230918160257.30127-4-philmd@linaro.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Mon, 18 Sep 2023 18:02:36 +0200
Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> wrote:

> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  target/i386/kvm/kvm-cpu.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/target/i386/kvm/kvm-cpu.c b/target/i386/kvm/kvm-cpu.c
> index 7237378a7d..1fe62ce176 100644
> --- a/target/i386/kvm/kvm-cpu.c
> +++ b/target/i386/kvm/kvm-cpu.c
> @@ -37,6 +37,7 @@ static bool kvm_cpu_realizefn(CPUState *cs, Error **err=
p)
>       *  -> cpu_exec_realizefn():
>       *            -> accel_cpu_realizefn()
>       *               kvm_cpu_realizefn() -> host_cpu_realizefn()
> +     *  -> cpu_common_realizefn()
>       *  -> check/update ucode_rev, phys_bits, mwait
>       */
>      if (cpu->max_features) {


