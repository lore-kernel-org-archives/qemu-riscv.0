Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pUWsW-0007cz-6z
	for mharc-qemu-riscv@gnu.org; Tue, 21 Feb 2023 12:56:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pUWsU-0007cY-Kp
 for qemu-riscv@nongnu.org; Tue, 21 Feb 2023 12:56:34 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pUWsT-0006RH-38
 for qemu-riscv@nongnu.org; Tue, 21 Feb 2023 12:56:34 -0500
Received: by mail-pl1-x62a.google.com with SMTP id u14so2010956ple.7
 for <qemu-riscv@nongnu.org>; Tue, 21 Feb 2023 09:56:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8FZF5olWX/MFoaZaOXMYywStP/0w8sgUS6+NDQeB3jM=;
 b=ekuy3hjjsbHWU9qbroiqqA5sd6k4UHq3/b8rZX/1yOKIV7lSYTLmP7rzavWupkPNtP
 L7GNil/+Rb6wZcmoMc1IUN3mokFIxgARXbv6/10s7oaIO6JgV2C0BKjqVYK+LeeF4AAd
 NSyUzSrwgGdlXe+kRCnVVgmdyrJaJ29z7CNXRgkfZ055dKQ30AUKmLidgl34ufaubGke
 /mnp46LdblNtY1W40yBA/fufBYOGCKyIO0fD/TLwBi0RAHwXLVM7yuaHEoCbi98t8x/g
 R86Rg2YK0YrM1697UArSOpOUXhpHVlGC0+HKkzMkFpj9O3AhUzAP9Lj7rjLoN6DJEfd4
 726g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8FZF5olWX/MFoaZaOXMYywStP/0w8sgUS6+NDQeB3jM=;
 b=KNJcmueVGzj6oE/MtisOp70HM5UeCq1bZsMQA/jZO13EDhav2EBGQ58YLfu1qbTwtn
 D3rXmSGN8VrbkHfjoD01SkoQO7JlP/WTPX3ebF2gRFD22lzLtyGPEW2bOAvAMfka1X7r
 ZPxKsDEslHoVkUgD8sNHq/aqddwfsmkLWNxsH1J7meguj+rUfeZ+/PCADqPQaInMGKCh
 nqSAPKDlHsMKfrqnGA+FQfi3VvSQFJvg0bkhOayEi9HeGlDLmh7T7HP8PZwz7tP5WXtD
 2mYfcUOv95w5hJJw2tCNyihVO5v1srxPuyqP/kxso9sx4C+BFynZRB2LBQMrSUSIw2jH
 J6lQ==
X-Gm-Message-State: AO0yUKXmhTUsx8sIzX7u1AxadHNY95Fm9HgPXRYKNbfEJ4au7wIGC40A
 fNhieM9iIM8ML/7Ez7dOPEQ+xQIF7Y1oJ3S4PEErjg==
X-Google-Smtp-Source: AK7set+Jk8BhzRLsPO4FWEKM9elLm8+AmO/qa4xWr+wu4VlEfMrphwrNhVJDfI0XAlKjwHmnZxfN3rb3EQGqo3jwxrE=
X-Received: by 2002:a17:90b:5109:b0:233:dcb5:ee15 with SMTP id
 sc9-20020a17090b510900b00233dcb5ee15mr1946913pjb.92.1677002191368; Tue, 21
 Feb 2023 09:56:31 -0800 (PST)
MIME-Version: 1.0
References: <20230216142338.82982-1-philmd@linaro.org>
 <20230216142338.82982-3-philmd@linaro.org>
In-Reply-To: <20230216142338.82982-3-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 Feb 2023 17:56:20 +0000
Message-ID: <CAFEAcA8v1q-OVoyZG14eDWL1_je=mzxk2U56mJ__P-eb2oAGJg@mail.gmail.com>
Subject: Re: [PATCH 2/5] hw/cpu/cluster: Only add CPU objects to CPU cluster
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>, 
 Dapeng Mi <dapeng1.mi@intel.com>, Sean Christopherson <seanjc@google.com>, 
 Bin Meng <bin.meng@windriver.com>,
 Zhuocheng Ding <zhuocheng.ding@intel.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Zhenyu Wang <zhenyu.z.wang@intel.com>, qemu-riscv@nongnu.org, 
 Alistair Francis <alistair.francis@wdc.com>, Zhao Liu <zhao1.liu@intel.com>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Robert Hoo <robert.hu@linux.intel.com>, 
 Yanan Wang <wangyanan55@huawei.com>, qemu-arm@nongnu.org, 
 Palmer Dabbelt <palmer@dabbelt.com>, Like Xu <like.xu.linux@gmail.com>, 
 Alistair Francis <alistair@alistair23.me>, Zhao Liu <zhao1.liu@linux.intel.com>,
 Eduardo Habkost <eduardo@habkost.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62a.google.com
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
X-List-Received-Date: Tue, 21 Feb 2023 17:56:34 -0000

On Thu, 16 Feb 2023 at 14:23, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> Do not recursively add CPU and all their children objects.
> Simply iterate on the cluster direct children, which must
> be of TYPE_CPU. Otherwise raise an error.

The documentation in include/hw/cpu/cluster.h says:

 * The CPUs may be either direct children of the cluster object, or indirec=
t
 * children (e.g. children of children of the cluster object).

If we want to change that we need to update the documentation too.

I'm not sure why this doesn't hit the error on the armsse.c
use of TYPE_CLUSTER -- there the objects we have to put in
the cluster are TYPE_ARMV7M, which are not themselves
TYPE_CPU. They're a container which contains a TYPE_CPU.
This is why the docs say that it's OK to have the CPU
be an indirect child. I think one of the riscv boards
may be also using this facility, but I'm less sure there.

thanks
-- PMM

