Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oaVKO-0006GO-MQ
	for mharc-qemu-riscv@gnu.org; Tue, 20 Sep 2022 00:57:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oaVKI-0006DO-UL; Tue, 20 Sep 2022 00:57:42 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:38790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oaVKH-0001sW-4U; Tue, 20 Sep 2022 00:57:42 -0400
Received: by mail-wr1-x42c.google.com with SMTP id b5so2342176wrr.5;
 Mon, 19 Sep 2022 21:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=sf+yjXUZ2IXukhH5UaeERJtNyhl+QRIlnvPlc0mykq8=;
 b=INBRXUtTn4f77El/2/P3WXjwa3VcUTxtrP1wFIDUvyAEGQuR4JdU8p5dXhkW+WOyoi
 aoucRXOyi92aAnFe7bOLEAZibHBlkHtvFejKVFbXmRBMjzPIh0QtKo5E1ehhEN3by8eV
 17JDnHMtDeKFLvdX8LOcEdcAGUaBlxldWLzJeEDB059E3k0gVClrPR8sLUj64MYCBXPW
 U4IWEn9NgUDZaS84v7Xcnwa8N50RXPQuuOzX7HKjzYTF1wFu0KvbUzVHydFrkNBQIdcj
 7SYes6exvX/5Vh89DdneU4padIai8aVEZ3yvM9L6bEsaMF8cH4VwUMhR2Fe4nYLK5lrT
 f3Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=sf+yjXUZ2IXukhH5UaeERJtNyhl+QRIlnvPlc0mykq8=;
 b=7zf7PzmOItsS5gy6vaq9vng8TZZ3HeIV4yD8DnYWRIBFjQuc2oZ7Ssf++qA9IDNOnU
 +LZINodircyDtDdCdCtd7sXjXqkxYsj2slkxGhxDDBU8x+XZtQvPK4sqKNNQFB/r165Z
 iqZ4tnIJpnNhkBIAdJxYC8Br6rWQAWokPSHz9UCq+adIj0ap4hqJpbFtWqau9ce3AcqL
 G8o2MivNet70cjW+qKWOKvtoR90vNFr8+/7sNwNvtRa3f6hWW8ROSfCsnE8HI8mO2VOx
 z+l+EsDxjyVt5a3nz4YtZyzYhAIxU2JNhHF5tZvNDINY1ZxF4dDp4/SWFDGe7vc0kcMO
 j3fg==
X-Gm-Message-State: ACrzQf3lkCjx8xpfcnnKIC/3nqBS6OEfo5jor1eGp2bl6MGh5eo3tOIC
 jrhyeArd8rwXw3jSoQT9fug=
X-Google-Smtp-Source: AMsMyM7xk9eQhMG0hy5vzO0uxqQyyAFLD2EaloYjIUcvuXMcivTCqCiOehaR1VmADyoWYmuRlw8Yow==
X-Received: by 2002:a5d:4d4e:0:b0:22a:e7fe:e3bd with SMTP id
 a14-20020a5d4d4e000000b0022ae7fee3bdmr9244091wru.311.1663649856601; 
 Mon, 19 Sep 2022 21:57:36 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 c3-20020a05600c0a4300b003b47ff307e1sm749536wmq.31.2022.09.19.21.57.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Sep 2022 21:57:36 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Message-ID: <07db3f3a-90d9-c0db-df26-de7a667620be@amsat.org>
Date: Tue, 20 Sep 2022 06:57:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH 6/9] target/loongarch/cpu: Remove unneeded include
 directive
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Magnus Damm
 <magnus.damm@gmail.com>, Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Bandan Das <bsd@redhat.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Sergio Lopez <slp@redhat.com>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, Cameron Esfahani
 <dirty@apple.com>, Michael Rolnik <mrolnik@gmail.com>,
 Song Gao <gaosong@loongson.cn>, Jagannathan Raman <jag.raman@oracle.com>,
 Greg Kurz <groug@kaod.org>, Kamil Rytarowski <kamil@netbsd.org>,
 Peter Xu <peterx@redhat.com>, Joel Stanley <joel@jms.id.au>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, haxm-team@intel.com,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 qemu-ppc@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Helge Deller <deller@gmx.de>,
 Stefano Stabellini <sstabellini@kernel.org>, qemu-riscv@nongnu.org,
 Stafford Horne <shorne@gmail.com>, Paul Durrant <paul@xen.org>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Alexander Graf <agraf@csgraf.de>, Thomas Huth <thuth@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Wenchao Wang <wenchao.wang@intel.com>, Tony Krowiak
 <akrowiak@linux.ibm.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 qemu-s390x@nongnu.org, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Eric Farman <farman@linux.ibm.com>, Reinoud Zandijk <reinoud@netbsd.org>,
 Alexander Bulekov <alxndr@bu.edu>, Yanan Wang <wangyanan55@huawei.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Tyrone Ting <kfting@nuvoton.com>,
 xen-devel@lists.xenproject.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 John Snow <jsnow@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Darren Kenny <darren.kenny@oracle.com>, kvm@vger.kernel.org,
 Qiuhao Li <Qiuhao.Li@outlook.com>, John G Johnson
 <john.g.johnson@oracle.com>, Bin Meng <bin.meng@windriver.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, Max Filippov
 <jcmvbkbc@gmail.com>, qemu-arm@nongnu.org,
 Marcelo Tosatti <mtosatti@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Anthony Perard <anthony.perard@citrix.com>, Andrew Jeffery
 <andrew@aj.id.au>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
 Jason Wang <jasowang@redhat.com>, David Hildenbrand <david@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Alistair Francis
 <alistair@alistair23.me>, Jason Herne <jjherne@linux.ibm.com>
References: <20220919231720.163121-1-shentey@gmail.com>
 <20220919231720.163121-7-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20220919231720.163121-7-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.952,
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
X-List-Received-Date: Tue, 20 Sep 2022 04:57:43 -0000

On 20/9/22 01:17, Bernhard Beschow wrote:
> The cpu is used in both user and system emulation context while sysbus.h
> is system-only. Remove it since it's not needed anyway. Furthermore, it
> would cause a compile error in the next commit.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   target/loongarch/cpu.h | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/target/loongarch/cpu.h b/target/loongarch/cpu.h
> index dce999aaac..c9ed2cb3e7 100644
> --- a/target/loongarch/cpu.h
> +++ b/target/loongarch/cpu.h
> @@ -13,7 +13,6 @@
>   #include "hw/registerfields.h"
>   #include "qemu/timer.h"
>   #include "exec/memory.h"
> -#include "hw/sysbus.h"
>   
>   #define IOCSRF_TEMP             0
>   #define IOCSRF_NODECNT          1

Renaming the subject as 'target: Remove unneeded "hw/sysbus.h" include 
directive' and fixing target/ppc/kvm.c:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

