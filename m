Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mQAvi-0003YZ-Pb
	for mharc-qemu-riscv@gnu.org; Tue, 14 Sep 2021 12:05:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mQAvd-0003Tu-2j
 for qemu-riscv@nongnu.org; Tue, 14 Sep 2021 12:05:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mQAvX-00053O-VH
 for qemu-riscv@nongnu.org; Tue, 14 Sep 2021 12:05:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631635494;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fwSgd185T8jrnRcPRkYx6E8h8fWkH+f8/s0umRpbj/o=;
 b=KrSd0f6jE2tpywIRe4J1WsD6MFNnoU2q8OwVZto51Nf6CO8VGdfbPnj+hwEFzl4HQ3cw85
 yNVY7nSNtJZGQ1oWJvFe488lZ+ZgVvY0hDzLEmDTER7p5qHWeoDyJMZegaLqqFU66hud+u
 derxa8bZLBLIaUWtrIgdW2fLzVTq598=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-184-t6h3WNuxMzy7kxk44dPpvg-1; Tue, 14 Sep 2021 12:04:53 -0400
X-MC-Unique: t6h3WNuxMzy7kxk44dPpvg-1
Received: by mail-wr1-f72.google.com with SMTP id
 x7-20020a5d6507000000b0015dada209b1so3200341wru.15
 for <qemu-riscv@nongnu.org>; Tue, 14 Sep 2021 09:04:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fwSgd185T8jrnRcPRkYx6E8h8fWkH+f8/s0umRpbj/o=;
 b=AephlrHxLkTrIa1kcX908XieKLKwe6AWeCIlf3C1GzL0dE5SUtnGgtMHQBOn/j8An9
 6SDdgkMf1fN1m+xr1JkFyBRZF0yuWwFDwBxbzd6qizkd0Pqcg+6fF1D48wU8zmd5j1R7
 QpGzZ/vKMjhegFOymu0XjHf8wA0WO+x1yJENgUb6Wrb8XTtoqjjzFQnndZGOSNEGppwZ
 AsYvhDjRhpNQX14sNCcr0ZYDtoUzopxRDzCZiKchGQ/f+UBL+Xu9mwLji+4qINajjJnO
 YioOkaNEa41rzpzLiYLzTqRKQQRGA5/5eoA4fcjsaxyHzLvH1E/U1kWTqCP0zM4ntUTD
 wCyQ==
X-Gm-Message-State: AOAM532zwUwAnf33t8FdvXL74r/X+efDlZdkwB2HaGPMz/DaebVV1rQY
 8rwVBC9Y4OVM3o/l9LMydE+VHlRO3/3ke1iTHYJLo8hnpipLgD/ddVdIz7qleyD4Rep24IKV5f/
 XVyVVLfzhgKPOyDU=
X-Received: by 2002:a5d:630a:: with SMTP id i10mr13306087wru.178.1631635492540; 
 Tue, 14 Sep 2021 09:04:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxY9W8uuOq3x1502lnP8J8q4zQpVGcDdUWnjNiVmHX/lPv+I8nnf5Ku5qeSObPZKEx55QkDUQ==
X-Received: by 2002:a5d:630a:: with SMTP id i10mr13306025wru.178.1631635492254; 
 Tue, 14 Sep 2021 09:04:52 -0700 (PDT)
Received: from [192.168.1.36] (14.red-83-35-25.dynamicip.rima-tde.net.
 [83.35.25.14])
 by smtp.gmail.com with ESMTPSA id q7sm5175176wru.56.2021.09.14.09.04.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Sep 2021 09:04:51 -0700 (PDT)
Subject: Re: [PATCH v2 30/53] qapi: introduce x-query-roms QMP command
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Chris Wulff
 <crwulff@gmail.com>, David Hildenbrand <david@redhat.com>,
 Bin Meng <bin.meng@windriver.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Max Filippov <jcmvbkbc@gmail.com>, Taylor Simpson <tsimpson@quicinc.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Eric Blake <eblake@redhat.com>, Marek Vasut <marex@denx.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Markus Armbruster <armbru@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz
 <groug@kaod.org>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 Michael Rolnik <mrolnik@gmail.com>, Peter Xu <peterx@redhat.com>,
 Stafford Horne <shorne@gmail.com>, David Gibson
 <david@gibson.dropbear.id.au>, qemu-riscv@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
References: <20210914142042.1655100-1-berrange@redhat.com>
 <20210914142042.1655100-31-berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <342ccd00-7210-1169-fb9d-3fad8d3c3470@redhat.com>
Date: Tue, 14 Sep 2021 18:04:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210914142042.1655100-31-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.969, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 14 Sep 2021 16:05:03 -0000

On 9/14/21 4:20 PM, Daniel P. Berrangé wrote:
> This is a counterpart to the HMP "info roms" command. It is being
> added with an "x-" prefix because this QMP command is intended as an
> adhoc debugging tool and will thus not be modelled in QAPI as fully
> structured data, nor will it have long term guaranteed stability.
> The existing HMP command is rewritten to call the QMP command.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  hw/core/loader.c  | 55 ++++++++++++++++++++++++++++++++---------------
>  qapi/machine.json | 12 +++++++++++
>  2 files changed, 50 insertions(+), 17 deletions(-)

> -void hmp_info_roms(Monitor *mon, const QDict *qdict)
> +HumanReadableText *qmp_x_query_roms(Error **errp)
>  {
>      Rom *rom;
> +    g_autoptr(GString) buf = g_string_new("");
> +    HumanReadableText *ret;
>  
>      QTAILQ_FOREACH(rom, &roms, next) {
>          if (rom->mr) {
> -            monitor_printf(mon, "%s"
> -                           " size=0x%06zx name=\"%s\"\n",
> -                           memory_region_name(rom->mr),
> -                           rom->romsize,
> -                           rom->name);
> +            g_string_append_printf(buf, "%s"
> +                                   " size=0x%06zx name=\"%s\"\n",
> +                                   memory_region_name(rom->mr),
> +                                   rom->romsize,
> +                                   rom->name);
>          } else if (!rom->fw_file) {
> -            monitor_printf(mon, "addr=" TARGET_FMT_plx
> -                           " size=0x%06zx mem=%s name=\"%s\"\n",
> -                           rom->addr, rom->romsize,
> -                           rom->isrom ? "rom" : "ram",
> -                           rom->name);
> +            g_string_append_printf(buf, "addr=" TARGET_FMT_plx
> +                                   " size=0x%06zx mem=%s name=\"%s\"\n",
> +                                   rom->addr, rom->romsize,
> +                                   rom->isrom ? "rom" : "ram",
> +                                   rom->name);
>          } else {
> -            monitor_printf(mon, "fw=%s/%s"
> -                           " size=0x%06zx name=\"%s\"\n",
> -                           rom->fw_dir,
> -                           rom->fw_file,
> -                           rom->romsize,
> -                           rom->name);
> +            g_string_append_printf(buf, "fw=%s/%s"
> +                                   " size=0x%06zx name=\"%s\"\n",
> +                                   rom->fw_dir,
> +                                   rom->fw_file,
> +                                   rom->romsize,
> +                                   rom->name);
>          }
>      }
> +
> +    ret = g_new0(HumanReadableText, 1);
> +    ret->human_readable_text = g_steal_pointer(&buf->str);
> +    return ret;
> +}

Is it possible to have an helper in 'qapi/qmp/smth.h' such:

HumanReadableText *qmp_human_readable_text_new(GString **pbuf)
{
    HumanReadableText *ret = g_new0(HumanReadableText, 1);

    ret->human_readable_text = g_steal_pointer(pbuf);

    return ret;
}

?


