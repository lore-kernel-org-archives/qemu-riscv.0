Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o8MUt-0005Ob-Ga
	for mharc-qemu-riscv@gnu.org; Mon, 04 Jul 2022 09:52:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1o8MUs-0005Ic-3P
 for qemu-riscv@nongnu.org; Mon, 04 Jul 2022 09:52:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33827)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1o8MUo-0008BR-HD
 for qemu-riscv@nongnu.org; Mon, 04 Jul 2022 09:52:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656942733;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q751M0rPovJIc7Gzgfg8hbZcQMLANgFE95XkguNse7o=;
 b=Rxxc0YZuGRu1HCrK1Y3kC4pYwW1DeWXkWE5ysm+gfsyOc3ZN7UpaWDZxmUszlw+Re2IkpD
 STQCTblu+aSU/11yYqnpFSXT0ljFBXbbgeMi835xGZES3HDZzX/JWTWqHzpYmnkWy17HM/
 JtQjUsj4IxZOryyUR88fPhBymBER+sM=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-564-McTF8a2iN2mQmhjOecyAmA-1; Mon, 04 Jul 2022 09:52:12 -0400
X-MC-Unique: McTF8a2iN2mQmhjOecyAmA-1
Received: by mail-ed1-f69.google.com with SMTP id
 w5-20020a056402268500b0043980311a5fso6766470edd.3
 for <qemu-riscv@nongnu.org>; Mon, 04 Jul 2022 06:52:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=q751M0rPovJIc7Gzgfg8hbZcQMLANgFE95XkguNse7o=;
 b=55JuWR8d6LnckYwZvmBTAavlXhpqia4T2G0eSzKJrk4dQFo57VVvGjOVulxTGeRp/b
 g120gRnnsagZg1MZ1jyK+vhcSltY68PEWGUmzheVpPgOdX0433cAGYc33VT+MIloB+vX
 nonUDtBEOvL0nCnp4hsfHQqdA+ZV/M+9VbLlJr90S295uxdYaAwUwQKXEDFhBQ7pws3d
 ZdaPVAadRbW9HAKNgYgP1AX03aD2IORXrbyZHriMXMHHKDJcX8jF2odvn0QTJAEMlIn9
 muoYRKaWeGUdOl+qptDsg3ifr7MeYg6bJzu9I9xnOFZGPBS+jUPRxoVLbdiP4xtmqpRg
 coeA==
X-Gm-Message-State: AJIora/TMSwXtrAHxgo1ViKz5HKmp2FQ9ViPKvczk0dE43tBICJq/xt2
 Ig3bWtUZhpeiWK9BmaywZhIdWL2f1Vl/RoBk6s3lWSJR2JF+HlGaBkxMgBXGn9+7Eai6swvMsb5
 2eaajU8XF5/iKfdw=
X-Received: by 2002:a05:6402:5409:b0:42a:a643:4eb8 with SMTP id
 ev9-20020a056402540900b0042aa6434eb8mr38966578edb.71.1656942731667; 
 Mon, 04 Jul 2022 06:52:11 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tPKy4OUzaChncXMQQFOGbaz4IRM1djEQkRUB4kpqr7l3RCEqPPgp0y9Ekv7xLyzyPNNMNnIQ==
X-Received: by 2002:a05:6402:5409:b0:42a:a643:4eb8 with SMTP id
 ev9-20020a056402540900b0042aa6434eb8mr38966511edb.71.1656942731297; 
 Mon, 04 Jul 2022 06:52:11 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5056:d40:63e3:25a7:c1a1:4455?
 ([2a02:8071:5056:d40:63e3:25a7:c1a1:4455])
 by smtp.gmail.com with ESMTPSA id
 pv1-20020a170907208100b00726abf9cd8esm9850728ejb.125.2022.07.04.06.52.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Jul 2022 06:52:10 -0700 (PDT)
Message-ID: <89089143-3f55-02c4-c881-95d356108569@redhat.com>
Date: Mon, 4 Jul 2022 15:52:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 01/18] block: Make blk_{pread,pwrite}() return 0 on success
To: Alberto Faria <afaria@redhat.com>, qemu-devel@nongnu.org
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell
 <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, qemu-ppc@nongnu.org, Eric Blake <eblake@redhat.com>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 John Snow <jsnow@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Jeff Cody <codyprime@gmail.com>, qemu-riscv@nongnu.org,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>, Stefan Weil <sw@weilnetz.de>,
 Laurent Vivier <laurent@vivier.eu>, "Denis V. Lunev" <den@openvz.org>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, Greg Kurz <groug@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Kevin Wolf <kwolf@redhat.com>, "Edgar E. Iglesias"
 <edgar.iglesias@gmail.com>, qemu-arm@nongnu.org, Fam Zheng <fam@euphon.net>,
 Alistair Francis <alistair@alistair23.me>,
 Beniamino Galvani <b.galvani@gmail.com>, Bin Meng <bin.meng@windriver.com>,
 David Gibson <david@gibson.dropbear.id.au>
References: <20220517113524.197910-1-afaria@redhat.com>
 <20220517113524.197910-2-afaria@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220517113524.197910-2-afaria@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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
X-List-Received-Date: Mon, 04 Jul 2022 13:52:18 -0000

On 17.05.22 13:35, Alberto Faria wrote:
> They currently return the value of their 'bytes' parameter on success.
>
> Make them return 0 instead, for consistency with other I/O functions and
> in preparation to implement them using generated_co_wrapper. This also
> makes it clear that short reads/writes are not possible.
>
> Signed-off-by: Alberto Faria <afaria@redhat.com>
> ---
>   block.c                          |  8 +++++---
>   block/block-backend.c            |  7 ++-----
>   block/qcow.c                     |  6 +++---
>   hw/block/m25p80.c                |  2 +-
>   hw/misc/mac_via.c                |  2 +-
>   hw/misc/sifive_u_otp.c           |  2 +-
>   hw/nvram/eeprom_at24c.c          |  4 ++--
>   hw/nvram/spapr_nvram.c           | 12 ++++++------
>   hw/ppc/pnv_pnor.c                |  2 +-
>   qemu-img.c                       | 17 +++++++----------
>   qemu-io-cmds.c                   | 18 ++++++++++++------
>   tests/unit/test-block-iothread.c |  4 ++--
>   12 files changed, 43 insertions(+), 41 deletions(-)

Overall, looks good to me, so first of all:

Reviewed-by: Hanna Reitz <hreitz@redhat.com>

There are a couple of places where you decided to replace “*len” 
variables that used to store the return value by a plain “ret”. That 
seems good to me, given how these functions no longer return length 
values, but you haven’t done so consistently.  Below, I have noted 
places where this wasn’t done; I wonder why, but my R-b stands 
regardless of whether you change them too or not.

[...]

> diff --git a/hw/misc/mac_via.c b/hw/misc/mac_via.c
> index 525e38ce93..0515d1818e 100644
> --- a/hw/misc/mac_via.c
> +++ b/hw/misc/mac_via.c
> @@ -1030,7 +1030,7 @@ static void mos6522_q800_via1_realize(DeviceState *dev, Error **errp)
>           }
>   
>           len = blk_pread(v1s->blk, 0, v1s->PRAM, sizeof(v1s->PRAM));
> -        if (len != sizeof(v1s->PRAM)) {
> +        if (len < 0) {

We could use `ret` here instead.

>               error_setg(errp, "can't read PRAM contents");
>               return;
>           }

[...]

> diff --git a/hw/nvram/eeprom_at24c.c b/hw/nvram/eeprom_at24c.c
> index 01a3093600..84acd71f5a 100644
> --- a/hw/nvram/eeprom_at24c.c
> +++ b/hw/nvram/eeprom_at24c.c
> @@ -65,7 +65,7 @@ int at24c_eeprom_event(I2CSlave *s, enum i2c_event event)
>           DPRINTK("clear\n");
>           if (ee->blk && ee->changed) {
>               int len = blk_pwrite(ee->blk, 0, ee->mem, ee->rsize, 0);
> -            if (len != ee->rsize) {
> +            if (len < 0) {
>                   ERR(TYPE_AT24C_EE
>                           " : failed to write backing file\n");
>               }
> @@ -165,7 +165,7 @@ void at24c_eeprom_reset(DeviceState *state)
>       if (ee->blk) {
>           int len = blk_pread(ee->blk, 0, ee->mem, ee->rsize);
>   
> -        if (len != ee->rsize) {
> +        if (len < 0) {

We could rename `len` to `ret` in both of these hunks.

>               ERR(TYPE_AT24C_EE
>                       " : Failed initial sync with backing file\n");
>           }
> diff --git a/hw/nvram/spapr_nvram.c b/hw/nvram/spapr_nvram.c
> index 18b43be7f6..6000b945c3 100644
> --- a/hw/nvram/spapr_nvram.c
> +++ b/hw/nvram/spapr_nvram.c

[...]

> @@ -181,7 +181,7 @@ static void spapr_nvram_realize(SpaprVioDevice *dev, Error **errp)
>       if (nvram->blk) {
>           int alen = blk_pread(nvram->blk, 0, nvram->buf, nvram->size);
>   
> -        if (alen != nvram->size) {
> +        if (alen < 0) {

As above (and the other case in this file), might be nice to drop `alen` 
here and just use `ret` instead.

>               error_setg(errp, "can't read spapr-nvram contents");
>               return;
>           }

[...]

> diff --git a/qemu-img.c b/qemu-img.c
> index 4cf4d2423d..9d98ef63ac 100644
> --- a/qemu-img.c
> +++ b/qemu-img.c
> @@ -5120,30 +5120,27 @@ static int img_dd(int argc, char **argv)
>       in.buf = g_new(uint8_t, in.bsz);
>   
>       for (out_pos = 0; in_pos < size; block_count++) {
> -        int in_ret, out_ret;
> +        int bytes, in_ret, out_ret;
>   
> -        if (in_pos + in.bsz > size) {
> -            in_ret = blk_pread(blk1, in_pos, in.buf, size - in_pos);
> -        } else {
> -            in_ret = blk_pread(blk1, in_pos, in.buf, in.bsz);
> -        }
> +        bytes = (in_pos + in.bsz > size) ? size - in_pos : in.bsz;
> +
> +        in_ret = blk_pread(blk1, in_pos, in.buf, bytes);
>           if (in_ret < 0) {
>               error_report("error while reading from input image file: %s",
>                            strerror(-in_ret));
>               ret = -1;
>               goto out;
>           }
> -        in_pos += in_ret;
> -
> -        out_ret = blk_pwrite(blk2, out_pos, in.buf, in_ret, 0);
> +        in_pos += bytes;
>   
> +        out_ret = blk_pwrite(blk2, out_pos, in.buf, bytes, 0);
>           if (out_ret < 0) {
>               error_report("error while writing to output image file: %s",
>                            strerror(-out_ret));
>               ret = -1;
>               goto out;
>           }
> -        out_pos += out_ret;
> +        out_pos += bytes;
>       }
>   
>   out:

We could use this opportunity to drop in_ret and out_ret altogether (but 
we can also decide not to).

Hanna


