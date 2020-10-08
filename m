Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kQSja-0003A8-FP
	for mharc-qemu-riscv@gnu.org; Thu, 08 Oct 2020 06:01:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kQSjY-00039h-Md
 for qemu-riscv@nongnu.org; Thu, 08 Oct 2020 06:01:12 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:33844)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kQSjV-0001VZ-NN
 for qemu-riscv@nongnu.org; Thu, 08 Oct 2020 06:01:12 -0400
Received: by mail-ej1-x62c.google.com with SMTP id u8so7260924ejg.1
 for <qemu-riscv@nongnu.org>; Thu, 08 Oct 2020 03:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eloJToFC63NRjpwM8VbhiW+S7qE4fG6bP32gqbRdD+k=;
 b=QnK0u8W+wVMbGRCeazs2dDyNdOlbNEzt8uirEZsCt5ypeiw/supPdgEebDQ0A7m2Ri
 EmCEDXKJbcdFadyNZdPk7pNAVxARHckeoW5eEjZePyhICgpo6DPjcSxEh/2Dq7O0H4tu
 CH6vcR7saT5SWbvzvZBXxLNpAYxWDb5pl+74UTJvBVmqRqS1pXkb8OovFkODyNGXj5nj
 Oe9rpXZencEiyGRLIChDA9LuGCCZe0hcuzrHY7s1gX+we3kbIYXFNSYvGKNCWhpGP3qD
 xr6ra93x8kQ2d6xOU9kQpzxPIX48dZmVnvAPoD7IcJfXdFLap3zN19sWX9e682t1PMx4
 M8RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eloJToFC63NRjpwM8VbhiW+S7qE4fG6bP32gqbRdD+k=;
 b=kXbTV6RnvMv97g6k08H8/kn2igZ+YhTA6JvXu4z0W4MX5b+MGneUF8oYTvh3sHscUM
 TXen6jcHVfPnIMqb2CktnMmFMSxX7Gu3t7liWD0GYkfOAjy730rrBmSK1QoidFSmobuz
 6Sbs/2KaJgOz0P9kXLWVyXcd4EFHg7NuF+HcLkSOgZN+JkdJS1n9IFDDvGMNk9slVjld
 47aKofEQu77TqWucEuSWwi+n5h49Q8qBM1B44Nul+dADyjV8fJFY/1PEJktcmr/fz0aQ
 srPtbjWoAzKHqx9ubfs00676MexglDO3/+6okDkRxGraFRhqe0bhsskrkr/7LieGPp+L
 nWZQ==
X-Gm-Message-State: AOAM5337HjIEfnmmPLyMVbPd1gRQshYD167uYntuXVRcs76cbZsjNDTW
 miwQm/SEgBzcTTe119q+nq4yWXeOxsvLgnOr/8gh7g==
X-Google-Smtp-Source: ABdhPJwILtXqid7N8FtTtnQcgK4rxvfw8FVqz6Bw3uEo5KF0fO3M1LOMZKZJdUQa/MQFavFueafAq4pQzuwuQ4A0xB0=
X-Received: by 2002:a17:907:4365:: with SMTP id
 nd5mr8128802ejb.56.1602151265968; 
 Thu, 08 Oct 2020 03:01:05 -0700 (PDT)
MIME-Version: 1.0
References: <20201006220647.GR7303@habkost.net>
 <CAFEAcA_se7jErv9AFM2D7UdDMurB9Lb6W9aAXD6648spQ6idKg@mail.gmail.com>
 <87mu0xyrtn.fsf@dusky.pond.sub.org>
In-Reply-To: <87mu0xyrtn.fsf@dusky.pond.sub.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 8 Oct 2020 11:00:54 +0100
Message-ID: <CAFEAcA_txULmHTGipXp=7PW9gkM-JFf=5WT9h=BNKKpLcr+uEQ@mail.gmail.com>
Subject: Re: Purpose of QOM properties registered at realize time?
To: Markus Armbruster <armbru@redhat.com>
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
 qemu-ppc <qemu-ppc@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>, 
 "Daniel P. Berrange" <berrange@redhat.com>, John Snow <jsnow@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 08 Oct 2020 10:01:13 -0000

On Thu, 8 Oct 2020 at 10:45, Markus Armbruster <armbru@redhat.com> wrote:
> In real hardware, the number of GPIOs and such is fixed.

That depends on your point of view. Often this kind of
parameter is configurable in the hardware also, as a
parameter to the RTL, so different boards/SoCs using the
same device may vary in how they choose to configure it.

thanks
-- PMM

