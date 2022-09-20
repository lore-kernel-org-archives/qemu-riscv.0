Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oamb1-0008SB-GP
	for mharc-qemu-riscv@gnu.org; Tue, 20 Sep 2022 19:24:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oamaz-0008Jn-3L; Tue, 20 Sep 2022 19:24:05 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:33751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oamaw-00077A-BK; Tue, 20 Sep 2022 19:24:03 -0400
Received: by mail-ej1-x62d.google.com with SMTP id lc7so9960137ejb.0;
 Tue, 20 Sep 2022 16:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date;
 bh=qKZPVG5iME12/xaovZM6A6+qsWvmHnon3GYaJNYHOS8=;
 b=fCK9HNlTrRewEDKb1ki/vTFY3BFU4vzCnR5/5SporYyj2K3I0iIme7NT7sFxvxSWk3
 umbS7mgSQHCv4vemkhsUb7I8ViXwtdzvdECA7Hg1aPJOJHkBgajnUvnzOd15ofRxvKPW
 2NmhmYzO4jI0zH5j583BH2fYOyCqRhQagr8KEfGrHxwOvw9vpW0RHacBcO/xfLZqnbG9
 JGQYdHCVFxtkFHNb5If1sypH5E1lsaKJVmD0Bts992LCNZLkqOhf1P9RqHOcsUAWXlWu
 d4YWu7xGj+i6DW0je9gZb13SoS+moDDgWL9JmB1tDOJPynLYKJKZy8VNJloyV8FGfrcV
 cuNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date;
 bh=qKZPVG5iME12/xaovZM6A6+qsWvmHnon3GYaJNYHOS8=;
 b=SKn4v4nreFHrzgxH0NqwAVBXIChM1IyU9GXy5ihKfnn0vRTJwuJqNLKLkpmqeZKkPE
 HY1wZW9PaTJVezbNECDOpKiajYDt0fKsx+mJIqoK4a5Ily2z2J/Gc3FJEAFjFyzpsBu3
 AHdr5PXrrlH72LJxBHlshtxx8fM/bbJ4TYryo+iaEV6LwQyN65AkBEnbJpAUh+P3m5iq
 g6PyAM6UYxgG+N7T56WfZ+BUW44xTtR5xjq4ZZ+p7jHxtiqhKoPwNQggUDD2kfRACJTk
 GkhZ+YgjvrZ8Tvc1Zd8K3FrwnV0uQvF6tVFxsJ75vwFAveZCp1Modv31vPBjRC8pbjRO
 DGcw==
X-Gm-Message-State: ACrzQf1SPTUiPHDJJWjyUqZSJqpDYpAPyq12Xpm6NAnpU0oV4UayJOet
 uf1NYBDJKyFbBKwtrdGUm64=
X-Google-Smtp-Source: AMsMyM5RM/OVc3EykNVPTfjHa4cDBJJ/DnJiA70xAhCb8RUZeIR5sVs3l/o+BP+JEU8fpdRpHUyjcA==
X-Received: by 2002:a17:906:eec9:b0:73d:c369:690f with SMTP id
 wu9-20020a170906eec900b0073dc369690fmr19058158ejb.767.1663716238901; 
 Tue, 20 Sep 2022 16:23:58 -0700 (PDT)
Received: from [127.0.0.1] (dynamic-078-054-006-055.78.54.pool.telefonica.de.
 [78.54.6.55]) by smtp.gmail.com with ESMTPSA id
 j22-20020a508a96000000b0044ed7a75c33sm689265edj.6.2022.09.20.16.23.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Sep 2022 16:23:58 -0700 (PDT)
Date: Tue, 20 Sep 2022 23:23:52 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: Markus Armbruster <armbru@redhat.com>,
 Alistair Francis <alistair23@gmail.com>, Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
CC: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Magnus Damm <magnus.damm@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Bandan Das <bsd@redhat.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Sergio Lopez <slp@redhat.com>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, Cameron Esfahani <dirty@apple.com>, 
 Michael Rolnik <mrolnik@gmail.com>, Song Gao <gaosong@loongson.cn>,
 Jagannathan Raman <jag.raman@oracle.com>, Greg Kurz <groug@kaod.org>,
 Kamil Rytarowski <kamil@netbsd.org>, Peter Xu <peterx@redhat.com>,
 Joel Stanley <joel@jms.id.au>, Alistair Francis <Alistair.Francis@wdc.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, haxm-team@intel.com,
 Roman Bolshakov <r.bolshakov@yadro.com>, Eric Auger <eric.auger@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 =?ISO-8859-1?Q?Daniel_P=2E_Berrang=E9?= <berrange@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 =?ISO-8859-1?Q?C=E9dric_Le_Goater?= <clg@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?ISO-8859-1?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>,
 "open list:New World" <qemu-ppc@nongnu.org>,
 Cornelia Huck <cohuck@redhat.com>, Helge Deller <deller@gmx.de>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Stafford Horne <shorne@gmail.com>, Paul Durrant <paul@xen.org>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Alexander Graf <agraf@csgraf.de>, Thomas Huth <thuth@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Wenchao Wang <wenchao.wang@intel.com>, Tony Krowiak <akrowiak@linux.ibm.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 qemu-s390x <qemu-s390x@nongnu.org>,
 =?ISO-8859-1?Q?Marc-Andr=E9_Lureau?= <marcandre.lureau@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Eric Farman <farman@linux.ibm.com>, Reinoud Zandijk <reinoud@netbsd.org>,
 Alexander Bulekov <alxndr@bu.edu>, Yanan Wang <wangyanan55@huawei.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Tyrone Ting <kfting@nuvoton.com>,
 "open list:X86" <xen-devel@lists.xenproject.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, John Snow <jsnow@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Darren Kenny <darren.kenny@oracle.com>,
 "open list:Overall" <kvm@vger.kernel.org>, Qiuhao Li <Qiuhao.Li@outlook.com>, 
 John G Johnson <john.g.johnson@oracle.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, Max Filippov <jcmvbkbc@gmail.com>, 
 qemu-arm <qemu-arm@nongnu.org>, Marcelo Tosatti <mtosatti@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Anthony Perard <anthony.perard@citrix.com>, Andrew Jeffery <andrew@aj.id.au>, 
 Artyom Tarasenko <atar4qemu@gmail.com>, Halil Pasic <pasic@linux.ibm.com>,
 "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
 Jason Wang <jasowang@redhat.com>, David Hildenbrand <david@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>,
 Alistair Francis <alistair@alistair23.me>,
 Jason Herne <jjherne@linux.ibm.com>
Subject: Re: [PATCH 1/9] hw/riscv/sifive_e: Fix inheritance of SiFiveEState
In-Reply-To: <87edw6xoog.fsf@pond.sub.org>
References: <20220919231720.163121-1-shentey@gmail.com>
 <20220919231720.163121-2-shentey@gmail.com>
 <CAKmqyKN+V2R8PkED67tB8+pCZs9369ViiL8OZ9XhO3SdUCk5=Q@mail.gmail.com>
 <87edw6xoog.fsf@pond.sub.org>
Message-ID: <0BBD7391-7B2D-44E7-9396-D1747784B9DA@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Tue, 20 Sep 2022 23:24:06 -0000

Am 20=2E September 2022 11:36:47 UTC schrieb Markus Armbruster <armbru@redh=
at=2Ecom>:
>Alistair Francis <alistair23@gmail=2Ecom> writes:
>
>> On Tue, Sep 20, 2022 at 9:18 AM Bernhard Beschow <shentey@gmail=2Ecom> =
wrote:
>>>
>>> SiFiveEState inherits from SysBusDevice while it's TypeInfo claims it =
to
>>> inherit from TYPE_MACHINE=2E This is an inconsistency which can cause
>>> undefined behavior such as memory corruption=2E
>>>
>>> Change SiFiveEState to inherit from MachineState since it is registere=
d
>>> as a machine=2E
>>>
>>> Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>>
>> Reviewed-by: Alistair Francis <alistair=2Efrancis@wdc=2Ecom>
>
>To the SiFive maintainers: since this is a bug fix, let's merge it right
>away=2E

I could repost this particular patch with the three new tags (incl=2E Fixe=
s) if desired=2E

Best regards,
Bernhard
>


