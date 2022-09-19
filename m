Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oaQFW-0004Yd-K8
	for mharc-qemu-riscv@gnu.org; Mon, 19 Sep 2022 19:32:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oaQEt-0004UY-5R; Mon, 19 Sep 2022 19:31:59 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:36468)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oaQEn-000440-Gq; Mon, 19 Sep 2022 19:31:43 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 s14-20020a17090a6e4e00b0020057c70943so8980805pjm.1; 
 Mon, 19 Sep 2022 16:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=NSIvRNfXT4BgiWoAffM4RsDVDd2SOkBJz5nw83+ZE0Q=;
 b=dIO7rKlwpt1a4Rr55TM/1OaCkqXzxn5HQ5hnLXBRwWHTkpqxju5K46xUcpujcqqOhY
 UT1qtY65c18HaDPPSpvVTvhQ9+fVBIzAfgdO1ePcqTnS8abQ/ssqUdN4PA8+BBbGscY4
 zcHOxvhGd/Rw79kJ916G+ztNW9eW1CWpGEOd7bJnYuq86Ev2kMsm0q8+XzwBszG8pjQ2
 Pve2h3B9fmVc6VWU3tTQ2teTgIPA46kmE7p9DGMxzzCgzN9yNZgGgirx1IC7zm5IGED/
 gjezyCWZTWWjo3xYAtiH58mh8QAjO7bV/tNRRbQG7XhlchTkciQZvl7gHKj0RWl+10FH
 DxUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=NSIvRNfXT4BgiWoAffM4RsDVDd2SOkBJz5nw83+ZE0Q=;
 b=CW1xkgtnCcCANlGFq9DS4TFDrNvhKNoBo4lrTchoWKiFutdnO+VVdeJubJdL/jwbxt
 pyUcKB1e2oKYZZCoWIUZg+fUk/YaVioNqqLRGYEQ1KbFW/DLtBQuDmzZS2Jq7WEA1Lhn
 VOtXJR6VEIJhsprFfP36z0I2cMV3i/cSiy5Yj6Kd63wt0ikJwyUN0pAOs6+qHOq0Fg4o
 6Gcr4qlK/Sgn3LMXQjg3bpwk7goQFFlw+A4nX5IKO/peVNc1v5+yHfr/iI6EDX4zIIT8
 undGi53iOXbLPSYLOeKxy3d6qb8IbJT+qrg9IpEeBzxSAKZnVOcqejoy+2wSfjxAj8XG
 ZxjQ==
X-Gm-Message-State: ACrzQf1oWn5cdhw6tEO7+R5Hkzzhm9E7eK7vAsCtLhxRp3t+h8QjVd6l
 EjGjd9D9CrRHTt0LR584zQWoCFQ3wXlngwlNNio=
X-Google-Smtp-Source: AMsMyM5CNfH4JqOtjO62MVBjvYF0+2r5Smy7El5C/g8RoLI2QIg17MckqusD++UPU8lggRnlhnNJDkN9NdqBYMgnYv8=
X-Received: by 2002:a17:90b:1b50:b0:202:f495:6b43 with SMTP id
 nv16-20020a17090b1b5000b00202f4956b43mr680878pjb.85.1663630296957; Mon, 19
 Sep 2022 16:31:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220919231720.163121-1-shentey@gmail.com>
 <20220919231720.163121-2-shentey@gmail.com>
In-Reply-To: <20220919231720.163121-2-shentey@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 20 Sep 2022 09:31:10 +1000
Message-ID: <CAKmqyKN+V2R8PkED67tB8+pCZs9369ViiL8OZ9XhO3SdUCk5=Q@mail.gmail.com>
Subject: Re: [PATCH 1/9] hw/riscv/sifive_e: Fix inheritance of SiFiveEState
To: Bernhard Beschow <shentey@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, 
 Magnus Damm <magnus.damm@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, 
 Bandan Das <bsd@redhat.com>, Matthew Rosato <mjrosato@linux.ibm.com>, 
 Daniel Henrique Barboza <danielhb413@gmail.com>, Sergio Lopez <slp@redhat.com>,
 Alexey Kardashevskiy <aik@ozlabs.ru>, Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Cameron Esfahani <dirty@apple.com>, Michael Rolnik <mrolnik@gmail.com>,
 Song Gao <gaosong@loongson.cn>, 
 Jagannathan Raman <jag.raman@oracle.com>, Greg Kurz <groug@kaod.org>, 
 Kamil Rytarowski <kamil@netbsd.org>, Peter Xu <peterx@redhat.com>,
 Joel Stanley <joel@jms.id.au>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, haxm-team@intel.com, 
 Roman Bolshakov <r.bolshakov@yadro.com>, Markus Armbruster <armbru@redhat.com>,
 Eric Auger <eric.auger@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Stefan Hajnoczi <stefanha@redhat.com>, Qemu-block <qemu-block@nongnu.org>, 
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>, 
 "open list:New World" <qemu-ppc@nongnu.org>, Cornelia Huck <cohuck@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Helge Deller <deller@gmx.de>, 
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, Stafford Horne <shorne@gmail.com>,
 Paul Durrant <paul@xen.org>, Havard Skinnemoen <hskinnemoen@google.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>, 
 Alexander Graf <agraf@csgraf.de>, Thomas Huth <thuth@redhat.com>, 
 Alex Williamson <alex.williamson@redhat.com>,
 Wenchao Wang <wenchao.wang@intel.com>, 
 Tony Krowiak <akrowiak@linux.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 qemu-s390x <qemu-s390x@nongnu.org>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Eric Farman <farman@linux.ibm.com>, 
 Reinoud Zandijk <reinoud@netbsd.org>, Alexander Bulekov <alxndr@bu.edu>,
 Yanan Wang <wangyanan55@huawei.com>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Tyrone Ting <kfting@nuvoton.com>,
 "open list:X86" <xen-devel@lists.xenproject.org>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>, John Snow <jsnow@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Darren Kenny <darren.kenny@oracle.com>, 
 "open list:Overall" <kvm@vger.kernel.org>, Qiuhao Li <Qiuhao.Li@outlook.com>, 
 John G Johnson <john.g.johnson@oracle.com>, Bin Meng <bin.meng@windriver.com>, 
 Sunil Muthuswamy <sunilmut@microsoft.com>, Max Filippov <jcmvbkbc@gmail.com>, 
 qemu-arm <qemu-arm@nongnu.org>, Marcelo Tosatti <mtosatti@redhat.com>, 
 Peter Maydell <peter.maydell@linaro.org>,
 Anthony Perard <anthony.perard@citrix.com>, 
 Andrew Jeffery <andrew@aj.id.au>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Halil Pasic <pasic@linux.ibm.com>, 
 "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
 Jason Wang <jasowang@redhat.com>, 
 David Hildenbrand <david@redhat.com>, Laurent Vivier <laurent@vivier.eu>, 
 Alistair Francis <alistair@alistair23.me>, Jason Herne <jjherne@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=alistair23@gmail.com; helo=mail-pj1-x1032.google.com
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
X-List-Received-Date: Mon, 19 Sep 2022 23:32:22 -0000

On Tue, Sep 20, 2022 at 9:18 AM Bernhard Beschow <shentey@gmail.com> wrote:
>
> SiFiveEState inherits from SysBusDevice while it's TypeInfo claims it to
> inherit from TYPE_MACHINE. This is an inconsistency which can cause
> undefined behavior such as memory corruption.
>
> Change SiFiveEState to inherit from MachineState since it is registered
> as a machine.
>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  include/hw/riscv/sifive_e.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/include/hw/riscv/sifive_e.h b/include/hw/riscv/sifive_e.h
> index 83604da805..d738745925 100644
> --- a/include/hw/riscv/sifive_e.h
> +++ b/include/hw/riscv/sifive_e.h
> @@ -22,6 +22,7 @@
>  #include "hw/riscv/riscv_hart.h"
>  #include "hw/riscv/sifive_cpu.h"
>  #include "hw/gpio/sifive_gpio.h"
> +#include "hw/boards.h"
>
>  #define TYPE_RISCV_E_SOC "riscv.sifive.e.soc"
>  #define RISCV_E_SOC(obj) \
> @@ -41,7 +42,7 @@ typedef struct SiFiveESoCState {
>
>  typedef struct SiFiveEState {
>      /*< private >*/
> -    SysBusDevice parent_obj;
> +    MachineState parent_obj;
>
>      /*< public >*/
>      SiFiveESoCState soc;
> --
> 2.37.3
>
>

