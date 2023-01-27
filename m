Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pLQ7t-0000w7-UG
	for mharc-qemu-riscv@gnu.org; Fri, 27 Jan 2023 09:54:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pLQ7s-0000vU-90
 for qemu-riscv@nongnu.org; Fri, 27 Jan 2023 09:54:48 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pLQ7n-00032u-Nw
 for qemu-riscv@nongnu.org; Fri, 27 Jan 2023 09:54:45 -0500
Received: by mail-pl1-x631.google.com with SMTP id z13so5177482plg.6
 for <qemu-riscv@nongnu.org>; Fri, 27 Jan 2023 06:54:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=LkDqyGrdQP09P8B3VOXn+2snrIqZ+RVtQwBSGQWoOuE=;
 b=tbV+DtYfL0Tt3h2SY0kE72VJ3f3GRcNM3eERMngALVTmFr4w3HvaHqdRSl/yJUNkfD
 8KEda7J0BuobaAq6VsFTrGQBThFt6Tj9pra9379MYarW87eRD7Mij4dk1O3m2TTV0daQ
 V3uS9MpvkY+bPFmOCoB7tzKqzwRgCdDFhfpoTF0kkCwaobzit8vutClr+rSYX2R//XjB
 rgjArxqS+KjE/niw3FHKeefz8atQnLwnv/t396aRMcPhavopo2IWwtP5JhM2n5H8tk25
 F3e4+UPYqlM2BJotAbFwRBq9Dsw8w/85a5xnj6gB/YaSAp1kR03Ez8iBW397pbhgohU4
 aKTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LkDqyGrdQP09P8B3VOXn+2snrIqZ+RVtQwBSGQWoOuE=;
 b=rChRLhFWhHJwvQpeFf9syrElPGHAzAD7CCr290pfQX6xihVsEPTWcTn45st29F5/it
 WkE+KZqIKVZIp4LgUu6sYJjaIHM3zVZQvwP0YREUJLGDowuxebfPWXgbBZ3mCV5CJCP8
 QDQgjIRZSGYfIc12qkFZ5nUno44zHwvFTHBz6W5vevNOK0TzoRMB0MpSYAeNeq/buMQe
 NdMnTGZ5UqFCK+HIfIQtL5cPt68YISu2VWlva7HX3PXfOrMbDXNYY4JQ8IyW8WgYYXQw
 /OJcW+kpMtgMhA8IRUMT3thh/GuzvaNU5I4z+fOdteiUY6d7Aszro6guCQRnu2gUGC+6
 kXmQ==
X-Gm-Message-State: AO0yUKVZpDLlMSRHtHalppbsAXuRwFZCF7qEnaL9XtRwamD6hVpdMFgd
 4orM5BVz8EG4RWLswGf3RUs1MdRKc1edZvK6BFev4w==
X-Google-Smtp-Source: AK7set+BwyxAKfRkJOIWYhmGmtqgxW/nvVV/wOB8DP+JLuUxKYXjGigYlwPknE1fpi3tOE6uxD7mb3NqRa6uPxGwO8M=
X-Received: by 2002:a17:90a:71c6:b0:22c:dfb:a9da with SMTP id
 m6-20020a17090a71c600b0022c0dfba9damr1928136pjs.115.1674831282251; Fri, 27
 Jan 2023 06:54:42 -0800 (PST)
MIME-Version: 1.0
References: <20230119065959.3104012-1-armbru@redhat.com>
 <20230119065959.3104012-5-armbru@redhat.com>
 <CANCZdfrU4zVcepMj=B5EVUz-qhCDhMYDs+cYS5yfW1-G01PsbA@mail.gmail.com>
In-Reply-To: <CANCZdfrU4zVcepMj=B5EVUz-qhCDhMYDs+cYS5yfW1-G01PsbA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 27 Jan 2023 14:54:30 +0000
Message-ID: <CAFEAcA8E98v5X5ekA16c6Fby2HAhOC5G4JYnN9TkrA9G7rVzvA@mail.gmail.com>
Subject: Re: [PATCH v4 04/19] bsd-user: Clean up includes
To: Warner Losh <imp@bsdimp.com>
Cc: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 richard.henderson@linaro.org, 
 pbonzini@redhat.com, kwolf@redhat.com, hreitz@redhat.com, kevans@freebsd.org, 
 berrange@redhat.com, groug@kaod.org, qemu_oss@crudebyte.com, mst@redhat.com, 
 philmd@linaro.org, alistair@alistair23.me, jasowang@redhat.com, 
 jonathan.cameron@huawei.com, kbastian@mail.uni-paderborn.de, 
 quintela@redhat.com, dgilbert@redhat.com, michael.roth@amd.com, 
 kkostiuk@redhat.com, tsimpson@quicinc.com, palmer@dabbelt.com, 
 bin.meng@windriver.com, qemu-block@nongnu.org, qemu-arm@nongnu.org, 
 qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Fri, 27 Jan 2023 14:54:48 -0000

On Thu, 19 Jan 2023 at 14:42, Warner Losh <imp@bsdimp.com> wrote:
>
> Also, why didn't you move sys/resource.h and other such files
> to os-dep.h? I'm struggling to understand the rules around what
> is or isn't included where?

The rough rule of thumb is that if some OS needs a compatibility
fixup or workaround for a system header (eg not every mmap.h
defines MAP_ANONYMOUS; on Windows unistd.h has to come before
time.h) then we put that header include and the compat workaround
into osdep.h. This avoids "only fails on obscure platform" issues
where somebody puts a header include into some specific .c file
but not the compat workaround, and it works on the Linux host
that most people develop and test on and we only find the
problem later.

There's also no doubt some includes there for historical
reasons, and some which really are "everybody needs these"
convenience ones. But we should probably not add new
includes to osdep.h unless they fall into the "working around
system header issues" bucket.

thanks
-- PMM

