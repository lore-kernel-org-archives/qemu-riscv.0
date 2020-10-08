Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kQY3I-00082p-KB
	for mharc-qemu-riscv@gnu.org; Thu, 08 Oct 2020 11:42:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kQY3G-00081K-I9
 for qemu-riscv@nongnu.org; Thu, 08 Oct 2020 11:41:54 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:36267)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kQY3C-0001TE-HP
 for qemu-riscv@nongnu.org; Thu, 08 Oct 2020 11:41:54 -0400
Received: by mail-ed1-x52e.google.com with SMTP id l16so6321568eds.3
 for <qemu-riscv@nongnu.org>; Thu, 08 Oct 2020 08:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=r64ZZx9bjWtXBdUUIcYa87604w1d3wlv8wpaQqXSNBs=;
 b=NEDom/NUNRHB0eufjsiezHXHVVl45V0GGbwJhWvFJMChVLUzwWm0LdtQyUx/2kLUW2
 3mjJUN5twjjA3D2j5hFMD//sTd69aSj9rYgGf02FsR8q+GXyPPAdXWly5nyDm2ZRLPV/
 Hdq6MulXotThxagrGzZ9KWlnhTCDCv+ylinS/ZuK718DmBMcCyrhQ4XxTWz4CcV+riFS
 EeZMUrKrcPEWoGjr6lf5J5bo98Af/6WKffzgUSYvUc3jMcyrGJJ7GMbW8rd8s7p8HV/6
 ShVo7y+ADjpjynyEnuDDKSgCGA8ezToXcjg5WH9lZk6Xskoz767JIHj2xOQwLvnDWEze
 O2wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=r64ZZx9bjWtXBdUUIcYa87604w1d3wlv8wpaQqXSNBs=;
 b=VjTh+x0ufag6jXQi79eDndc6Zax7MqgcxY4N9Fbt4cVqFXy+GvfHjlGG9Ch3YPXl6m
 +Fy3ChpXDLg6EH/EOOuweYGL7vfnOiKMzhTIrzj9YglpaG/WpKSN8g5rBES/7x/xIddp
 z9WgRbZKWnVe/MFEKZN1WQnmf75NpZqzTfwpuTAwuw43lpVON2rS8NFkrDDPXSaJE/P3
 hLQaYqvgIcgSBYYvwzLcNkmkbTxYolobfigN3KXRn+HgQktZAfmNVA7inNg4BBn+bvNl
 sB5PNFZ+FQcHReEAZdfRTKNlYOFUgT2WiJXKFtRLfSrsy/h90+0dSlfkFF02gNRMS+1J
 yNLg==
X-Gm-Message-State: AOAM530YxECgsmxBYPOY55DZB0UwCikF1rzPwpBEm/pPXt0PlcvnqJnO
 mNklUhsX4a655PuOobvffifWLIYmLiZ5MBiTXA2sHw==
X-Google-Smtp-Source: ABdhPJymr1L5xyunOcy4oj3bbm8HgyYr61RxhBc7l7QJilRUQfiAJFgGnhWuhtR/KZxpBVlq/CL6OcBGzcAMuDYbO/w=
X-Received: by 2002:aa7:dd4b:: with SMTP id o11mr9421777edw.251.1602171708747; 
 Thu, 08 Oct 2020 08:41:48 -0700 (PDT)
MIME-Version: 1.0
References: <20201006220647.GR7303@habkost.net>
 <CAFEAcA_se7jErv9AFM2D7UdDMurB9Lb6W9aAXD6648spQ6idKg@mail.gmail.com>
 <87mu0xyrtn.fsf@dusky.pond.sub.org> <20201008151521.GB7303@habkost.net>
In-Reply-To: <20201008151521.GB7303@habkost.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 8 Oct 2020 16:41:37 +0100
Message-ID: <CAFEAcA_=uScLjGR6vHbjsQK0-jgNuwNK+jcNf-u1yAh-863+2A@mail.gmail.com>
Subject: Re: Purpose of QOM properties registered at realize time?
To: Eduardo Habkost <ehabkost@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
 qemu-ppc <qemu-ppc@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>, 
 "Daniel P. Berrange" <berrange@redhat.com>, John Snow <jsnow@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 08 Oct 2020 15:41:54 -0000

On Thu, 8 Oct 2020 at 16:15, Eduardo Habkost <ehabkost@redhat.com> wrote:
>
> On Thu, Oct 08, 2020 at 11:45:08AM +0200, Markus Armbruster wrote:
> > A first class static array property, where the size of the array is part
> > of the value could perhaps cover this case.
>
> This is an interesting idea, I think we should explore that.
>
> qdev_pass_gpios() would become unnecessary and could be replaced
> by a single (static) alias property.

At least in the current implementation, aliasing properties
is not the only thing qdev_pass_gpios() does -- it also
updates the NamedGPIOList data structures. It might be
possible to reimplement it so that we really are just
aliasing properties, though.

thanks
-- PMM

