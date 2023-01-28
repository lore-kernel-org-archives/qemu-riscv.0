Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pLiTA-0006H0-3V
	for mharc-qemu-riscv@gnu.org; Sat, 28 Jan 2023 05:30:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pLiT8-0006Gs-Hq
 for qemu-riscv@nongnu.org; Sat, 28 Jan 2023 05:29:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pLiT6-0004IG-Ab
 for qemu-riscv@nongnu.org; Sat, 28 Jan 2023 05:29:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674901795;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6FB+edsbb44QCZ358g73Bl78hzSRCKhojxU7VjQ1JnU=;
 b=DqQ2siUyyzpGkblGexlCQ2MnoFhqe29XYdUXiNtMyioEvKXn7mH5TbyrW/r9ZHjrgvAKJv
 QA8PKElMMZxxi3dP2PH0uU5KaPQL6te10oKanSDtzeX/9kDhxvK8WkvI7p7rTDhhuW4RX1
 t/VSPTgqb4Hnxlv6Bxjv/JCEY1q31xw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-632-evhGpABgNveK72D0JOUSPA-1; Sat, 28 Jan 2023 05:29:54 -0500
X-MC-Unique: evhGpABgNveK72D0JOUSPA-1
Received: by mail-wm1-f72.google.com with SMTP id
 o5-20020a05600c4fc500b003db0b3230efso6128669wmq.9
 for <qemu-riscv@nongnu.org>; Sat, 28 Jan 2023 02:29:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6FB+edsbb44QCZ358g73Bl78hzSRCKhojxU7VjQ1JnU=;
 b=BMBTh4coGEtUIaiVmoUz4u9qxMAuEwiiQ3CleYZeQys5fPR7VxrdF4RSjOapZNRMKQ
 8SLFsqM8AH95D0CN9lkxYnEjhZ6jFHQV5k1rn1zy8KEiy6GtoFNwTqtP5boJmzZVFY2r
 6cZMt+1gFB5NOlcClm8/ClSlAtL3xEBv25pTJPR7UOh4dH7Olva5w0b8LddpdjjApzOj
 jovbJNrENO77bEe8+1YrHFMgLuyL1xQw3b2lf3j36pAngB7QERWKD7rNjy7me6KKdEHr
 jy0EO5KiYG1MdYSkU6MrtC6sKEOKIJrU6b4DzE1dkmqxpbdZBohx9xlYcHJIXQE3oS4G
 xmXg==
X-Gm-Message-State: AFqh2kp60B/l5Lq5bM1crowyAQNVsgSJUHhHOg6FZGvuUy8vMwZ6hiP6
 BYYr85TCR+i3TsAyeS9Wgm9OdcWWvQ/5Kv/pN6CxLoDglz6GHe+nRFapS7ErO89p705Pil5nTyK
 YvTJRNfH331LrvCQ=
X-Received: by 2002:a05:600c:4f4a:b0:3db:5f1:53a5 with SMTP id
 m10-20020a05600c4f4a00b003db05f153a5mr44594788wmq.20.1674901793169; 
 Sat, 28 Jan 2023 02:29:53 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuno6zz4nZQndocIplzwwOWQovv2WGK1jCz73RtkVbRaHT41YIqt6ePM429fHAtdaFDUUjG+g==
X-Received: by 2002:a05:600c:4f4a:b0:3db:5f1:53a5 with SMTP id
 m10-20020a05600c4f4a00b003db05f153a5mr44594772wmq.20.1674901792934; 
 Sat, 28 Jan 2023 02:29:52 -0800 (PST)
Received: from redhat.com ([2.52.20.248]) by smtp.gmail.com with ESMTPSA id
 i20-20020a05600c071400b003db0ad636d1sm9927098wmn.28.2023.01.28.02.29.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Jan 2023 02:29:52 -0800 (PST)
Date: Sat, 28 Jan 2023 05:29:47 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Warner Losh <imp@bsdimp.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, richard.henderson@linaro.org,
 pbonzini@redhat.com, kwolf@redhat.com, hreitz@redhat.com,
 kevans@freebsd.org, berrange@redhat.com, groug@kaod.org,
 qemu_oss@crudebyte.com, philmd@linaro.org, alistair@alistair23.me,
 jasowang@redhat.com, jonathan.cameron@huawei.com,
 kbastian@mail.uni-paderborn.de, quintela@redhat.com,
 dgilbert@redhat.com, michael.roth@amd.com, kkostiuk@redhat.com,
 tsimpson@quicinc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 qemu-block@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org
Subject: Re: [PATCH v4 04/19] bsd-user: Clean up includes
Message-ID: <20230128052729-mutt-send-email-mst@kernel.org>
References: <20230119065959.3104012-1-armbru@redhat.com>
 <20230119065959.3104012-5-armbru@redhat.com>
 <CANCZdfrU4zVcepMj=B5EVUz-qhCDhMYDs+cYS5yfW1-G01PsbA@mail.gmail.com>
 <CAFEAcA8E98v5X5ekA16c6Fby2HAhOC5G4JYnN9TkrA9G7rVzvA@mail.gmail.com>
 <20230127100052-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230127100052-mutt-send-email-mst@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Sat, 28 Jan 2023 10:29:58 -0000

On Fri, Jan 27, 2023 at 10:01:57AM -0500, Michael S. Tsirkin wrote:
> On Fri, Jan 27, 2023 at 02:54:30PM +0000, Peter Maydell wrote:
> > On Thu, 19 Jan 2023 at 14:42, Warner Losh <imp@bsdimp.com> wrote:
> > >
> > > Also, why didn't you move sys/resource.h and other such files
> > > to os-dep.h? I'm struggling to understand the rules around what
> > > is or isn't included where?
> > 
> > The rough rule of thumb is that if some OS needs a compatibility
> > fixup or workaround for a system header (eg not every mmap.h
> > defines MAP_ANONYMOUS; on Windows unistd.h has to come before
> > time.h) then we put that header include and the compat workaround
> > into osdep.h. This avoids "only fails on obscure platform" issues
> > where somebody puts a header include into some specific .c file
> > but not the compat workaround, and it works on the Linux host
> > that most people develop and test on and we only find the
> > problem later.
> > 
> > There's also no doubt some includes there for historical
> > reasons, and some which really are "everybody needs these"
> > convenience ones. But we should probably not add new
> > includes to osdep.h unless they fall into the "working around
> > system header issues" bucket.
> > 
> > thanks
> > -- PMM
> 
> 
> BTW maybe we should teach checkpatch about that rule:
> if a header is in osdep do not include it directly.

To be more precise, make checkpatch run clean-includes somehow?
Or just make CI run clean-includes on the tree and verify result
is empty?

> -- 
> MST


