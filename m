Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kIonl-0004Qt-TP
	for mharc-qemu-riscv@gnu.org; Thu, 17 Sep 2020 03:57:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1kIonW-0004KX-QP; Thu, 17 Sep 2020 03:57:46 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:40834)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1kIonT-0005wf-MM; Thu, 17 Sep 2020 03:57:42 -0400
Received: by mail-wm1-x335.google.com with SMTP id k18so1019858wmj.5;
 Thu, 17 Sep 2020 00:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=0dCsAB7sgvO3ijWAYy2/up8BNNwtjUjyvJiAJ0hrsQw=;
 b=Q4g0x1/IsGREWR0kbKpY2l8DwkxU+dS4gTBbw0CpOlamuknmRuFWE9lVdDWmsCGsHY
 JjPlYSAGVJJxZ/ug9VaBt/H4WqVmuid2Bd6fGItVIfgk/OkTjFvymQAns7fsIwqubg18
 7V+K4H4Nskpy1G7d9nzhV0yu9mopqqOcaddrtsllP3Hq2SBL3XQzTS8QgX5YhDLUMtu8
 SSEcignZB2aUctHKk21XskeVp/fFvCN3SU75mo/BaupV11nzsqipxZoprq3y/bFlmTEa
 wJtpEELAZLJWuJ072ECkX6OufwippgFlr3ichq1Ni/2+cT1/wox16G8yHIF0LvBXuv39
 jxSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=0dCsAB7sgvO3ijWAYy2/up8BNNwtjUjyvJiAJ0hrsQw=;
 b=SkPPWuzsK5Oa4WvcocE3MkJ8/rg/r2ZtqpCGJZ9kFdyOHTZD0fQKpcwZ9MtO8tXsKv
 y7pbHLnynAJVhTjpiO+yPqfzs9rg6FFf76XexZSqs3vLkg+YnFqVoPe/ujanYw9G6FJ+
 ljudmvy9qsxzfj2AHRT9RI7RWchvp0ejwGC3jXqbiLmqZnUG8I2MI6bnd7ysMZkwHbgh
 QgAChyihOgQhXmhgxmbd6nzGRHW9OGSmQbAvfnqKjzzOm9M8i6vx2P0fFv2l1Nz/a+3N
 4lc7Qtbx2v4CYjRArsfEZfRgers3mAA5FWs5u6QJae5sPquIAJH5g6Fmsgyd1JmivIS1
 ZlXA==
X-Gm-Message-State: AOAM530g/IJ3OdOoqBreqU/NVe/dd5mg/5Ai17DFhxy4oOFvzUIHwKxQ
 px5ATqHxaOGEj+dQZ5lBqWc=
X-Google-Smtp-Source: ABdhPJwEFP1IvlYvUVQzkk2Mche6UC+K5+G3jqaxP/E6EJ12vTu81AGm1S9kC3+lb5YcGOXL+ZDd4g==
X-Received: by 2002:a1c:7d55:: with SMTP id y82mr8635606wmc.100.1600329456159; 
 Thu, 17 Sep 2020 00:57:36 -0700 (PDT)
Received: from CBGR90WXYV0 (host86-176-94-160.range86-176.btcentralplus.com.
 [86.176.94.160])
 by smtp.gmail.com with ESMTPSA id g14sm9401272wrv.25.2020.09.17.00.57.34
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 17 Sep 2020 00:57:35 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
Reply-To: <paul@xen.org>
To: "'Eduardo Habkost'" <ehabkost@redhat.com>,
	<qemu-devel@nongnu.org>
Cc: "'Paolo Bonzini'" <pbonzini@redhat.com>,
 "'Daniel P. Berrange'" <berrange@redhat.com>,
 =?utf-8?Q?'Marc-Andr=C3=A9_Lureau'?= <marcandre.lureau@redhat.com>,
 "'Gerd Hoffmann'" <kraxel@redhat.com>,
 "'Michael S. Tsirkin'" <mst@redhat.com>,
 "'Peter Maydell'" <peter.maydell@linaro.org>,
 "'Corey Minyard'" <cminyard@mvista.com>,
 =?utf-8?Q?'C=C3=A9dric_Le_Goater'?= <clg@kaod.org>,
 "'David Gibson'" <david@gibson.dropbear.id.au>,
 "'Cornelia Huck'" <cohuck@redhat.com>, "'Thomas Huth'" <thuth@redhat.com>,
 "'Halil Pasic'" <pasic@linux.ibm.com>,
 "'Christian Borntraeger'" <borntraeger@de.ibm.com>,
 =?utf-8?Q?'Philippe_Mathieu-Daud=C3=A9'?= <f4bug@amsat.org>,
 "'Alistair Francis'" <alistair@alistair23.me>,
 "'David Hildenbrand'" <david@redhat.com>,
 "'Laurent Vivier'" <lvivier@redhat.com>, "'Amit Shah'" <amit@kernel.org>,
 "'Stefano Stabellini'" <sstabellini@kernel.org>,
 "'Anthony Perard'" <anthony.perard@citrix.com>,
 "'Fam Zheng'" <fam@euphon.net>,
 "'Gonglei \(Arei\)'" <arei.gonglei@huawei.com>,
 "'Igor Mammedov'" <imammedo@redhat.com>,
 "'Stefan Berger'" <stefanb@linux.ibm.com>,
 "'Richard Henderson'" <rth@twiddle.net>,
 "'Michael Rolnik'" <mrolnik@gmail.com>,
 "'Sarah Harris'" <S.E.Harris@kent.ac.uk>,
 "'Edgar E. Iglesias'" <edgar.iglesias@gmail.com>,
 "'Michael Walle'" <michael@walle.cc>,
 "'Aleksandar Markovic'" <aleksandar.qemu.devel@gmail.com>,
 "'Aurelien Jarno'" <aurelien@aurel32.net>,
 "'Jiaxun Yang'" <jiaxun.yang@flygoat.com>,
 "'Aleksandar Rikalo'" <aleksandar.rikalo@syrmia.com>,
 "'Anthony Green'" <green@moxielogic.com>,
 "'Chris Wulff'" <crwulff@gmail.com>, "'Marek Vasut'" <marex@denx.de>,
 "'Stafford Horne'" <shorne@gmail.com>,
 "'Palmer Dabbelt'" <palmer@dabbelt.com>,
 "'Sagar Karandikar'" <sagark@eecs.berkeley.edu>,
 "'Bastian Koppelmann'" <kbastian@mail.uni-paderborn.de>,
 "'Yoshinori Sato'" <ysato@users.sourceforge.jp>,
 "'Mark Cave-Ayland'" <mark.cave-ayland@ilande.co.uk>,
 "'Artyom Tarasenko'" <atar4qemu@gmail.com>,
 "'Guan Xuetao'" <gxt@mprc.pku.edu.cn>,
 "'Max Filippov'" <jcmvbkbc@gmail.com>, <qemu-arm@nongnu.org>,
 <qemu-ppc@nongnu.org>, <qemu-s390x@nongnu.org>, <qemu-block@nongnu.org>,
 <xen-devel@lists.xenproject.org>, <qemu-riscv@nongnu.org>
References: <20200916182519.415636-1-ehabkost@redhat.com>
 <20200916182519.415636-4-ehabkost@redhat.com>
In-Reply-To: <20200916182519.415636-4-ehabkost@redhat.com>
Subject: RE: [PATCH 3/5] qom: Remove module_obj_name parameter from
 OBJECT_DECLARE* macros
Date: Thu, 17 Sep 2020 08:57:33 +0100
Message-ID: <007c01d68cc8$347614f0$9d623ed0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQIelPz0+HUIa2jn7mxP/pozU40YBAMHPXtoqMQrdLA=
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=xadimgnik@gmail.com; helo=mail-wm1-x335.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Thu, 17 Sep 2020 07:57:54 -0000

> -----Original Message-----
> From: Eduardo Habkost <ehabkost@redhat.com>
> Sent: 16 September 2020 19:25
> To: qemu-devel@nongnu.org
> Cc: Paolo Bonzini <pbonzini@redhat.com>; Daniel P. Berrange =
<berrange@redhat.com>; Marc-Andr=C3=A9 Lureau
> <marcandre.lureau@redhat.com>; Gerd Hoffmann <kraxel@redhat.com>; =
Michael S. Tsirkin <mst@redhat.com>;
> Peter Maydell <peter.maydell@linaro.org>; Corey Minyard =
<cminyard@mvista.com>; C=C3=A9dric Le Goater
> <clg@kaod.org>; David Gibson <david@gibson.dropbear.id.au>; Cornelia =
Huck <cohuck@redhat.com>; Thomas
> Huth <thuth@redhat.com>; Halil Pasic <pasic@linux.ibm.com>; Christian =
Borntraeger
> <borntraeger@de.ibm.com>; Philippe Mathieu-Daud=C3=A9 =
<f4bug@amsat.org>; Alistair Francis
> <alistair@alistair23.me>; David Hildenbrand <david@redhat.com>; =
Laurent Vivier <lvivier@redhat.com>;
> Amit Shah <amit@kernel.org>; Stefano Stabellini =
<sstabellini@kernel.org>; Anthony Perard
> <anthony.perard@citrix.com>; Paul Durrant <paul@xen.org>; Fam Zheng =
<fam@euphon.net>; Gonglei (Arei)
> <arei.gonglei@huawei.com>; Igor Mammedov <imammedo@redhat.com>; Stefan =
Berger <stefanb@linux.ibm.com>;
> Richard Henderson <rth@twiddle.net>; Michael Rolnik =
<mrolnik@gmail.com>; Sarah Harris
> <S.E.Harris@kent.ac.uk>; Edgar E. Iglesias <edgar.iglesias@gmail.com>; =
Michael Walle
> <michael@walle.cc>; Aleksandar Markovic =
<aleksandar.qemu.devel@gmail.com>; Aurelien Jarno
> <aurelien@aurel32.net>; Jiaxun Yang <jiaxun.yang@flygoat.com>; =
Aleksandar Rikalo
> <aleksandar.rikalo@syrmia.com>; Anthony Green <green@moxielogic.com>; =
Chris Wulff <crwulff@gmail.com>;
> Marek Vasut <marex@denx.de>; Stafford Horne <shorne@gmail.com>; Palmer =
Dabbelt <palmer@dabbelt.com>;
> Sagar Karandikar <sagark@eecs.berkeley.edu>; Bastian Koppelmann =
<kbastian@mail.uni-paderborn.de>;
> Yoshinori Sato <ysato@users.sourceforge.jp>; Mark Cave-Ayland =
<mark.cave-ayland@ilande.co.uk>; Artyom
> Tarasenko <atar4qemu@gmail.com>; Guan Xuetao <gxt@mprc.pku.edu.cn>; =
Max Filippov <jcmvbkbc@gmail.com>;
> qemu-arm@nongnu.org; qemu-ppc@nongnu.org; qemu-s390x@nongnu.org; =
qemu-block@nongnu.org; xen-
> devel@lists.xenproject.org; qemu-riscv@nongnu.org
> Subject: [PATCH 3/5] qom: Remove module_obj_name parameter from =
OBJECT_DECLARE* macros
>=20
> One of the goals of having less boilerplate on QOM declarations
> is to avoid human error.  Requiring an extra argument that is
> never used is an opportunity for mistakes.
>=20
> Remove the unused argument from OBJECT_DECLARE_TYPE and
> OBJECT_DECLARE_SIMPLE_TYPE.
>=20
> Coccinelle patch used to convert all users of the macros:
>=20
>   @@
>   declarer name OBJECT_DECLARE_TYPE;
>   identifier InstanceType, ClassType, lowercase, UPPERCASE;
>   @@
>    OBJECT_DECLARE_TYPE(InstanceType, ClassType,
>   -                    lowercase,
>                        UPPERCASE);
>=20
>   @@
>   declarer name OBJECT_DECLARE_SIMPLE_TYPE;
>   identifier InstanceType, lowercase, UPPERCASE;
>   @@
>    OBJECT_DECLARE_SIMPLE_TYPE(InstanceType,
>   -                    lowercase,
>                        UPPERCASE);
>=20
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>

Acked-by: Paul Durrant <paul@xen.org>


