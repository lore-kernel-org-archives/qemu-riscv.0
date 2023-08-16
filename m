Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F9F2C04A6A
	for <qemu-riscv@archiver.kernel.org>; Wed, 16 Aug 2023 13:52:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qWGwU-0004Tf-9j; Wed, 16 Aug 2023 09:52:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1qWGwK-0004Nl-B1
 for qemu-riscv@nongnu.org; Wed, 16 Aug 2023 09:52:01 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1qWGwF-0004RI-0C
 for qemu-riscv@nongnu.org; Wed, 16 Aug 2023 09:51:57 -0400
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-1bc3d94d40fso55149385ad.3
 for <qemu-riscv@nongnu.org>; Wed, 16 Aug 2023 06:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1692193913; x=1692798713;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mZPCtM4gFlUO1eqBWQfyY/Y18ssOpc6HOYefevkB3hs=;
 b=E60lamU47sZQxI2mdxzaxIpzQ585cW73J6EcnIGUtt0mZ/TNXdyWMp2/dzxmLzyAfE
 Mu9LEylJIpAXxmDtu/izPvlfN/2tTaEfobzongnhiN/H75mF1tZM5KtcMx7wvcKqdGi6
 q22Oz6PXtIByw2bMo+CyND45GwR4JhJ74HXkvd2h5zmd7Py98uy4BGoGPVopqHtB8LSs
 AeH0zL/KiendIdwPw+xkOFfAHbOK7N/mIXRFAl63WX+dt3nS24h8J5RTTAORqtZfdL8r
 bZDS5s0hCOOkaMA5VCy1sdeKYT7TyloC8v5VknLg8AjYzAnMerp5cNFZ1K4wWw822ChR
 HS8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692193913; x=1692798713;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mZPCtM4gFlUO1eqBWQfyY/Y18ssOpc6HOYefevkB3hs=;
 b=J1YajC2IBNikJ0vrrJzqesB2Ovgxa4z0wYwO6oSkPgc8jwpIkX9ybuv/dEIO+7Y/UD
 gb74Ihn4/DexmuTSiRm9+Hxr4nU11rN4ayROw/WrvawAgOPlPN3l3o1PdBbBNEV/2sHa
 hJgrD2y+jBWyNGngIHkPhXILrEAzEbzzVgNnj1UJkf4fYdzEjlIsKIp+8/g7MBmek8Ip
 vaw90l2bgU53Vk2huOBs4G2uinLBzFbzln3MHA4/HKD9bfMbfX5pOL284purgMAmJqvl
 +g4j3ug8nTKNUIrBBI9D0sREPmEKE2T9MmKZJYYtyIjI5rOPPtZtU0bPIabU4FtABlWI
 FMhQ==
X-Gm-Message-State: AOJu0YxsxlxFhqtp+dO1loLIzEdJKKYm5Y676kaWqXn8KbX3wbptoezJ
 3LV6j0LB6Er43BpF6QGPpZ6qNg==
X-Google-Smtp-Source: AGHT+IF76m2gteYuU/ME8SyVTBxUSaRFmuZxrPHwMaaIRkLTBOKQwLw0o3YjJK7lICXb524S6ruUtA==
X-Received: by 2002:a17:902:bc89:b0:1bd:af7e:965d with SMTP id
 bb9-20020a170902bc8900b001bdaf7e965dmr2060152plb.51.1692193912914; 
 Wed, 16 Aug 2023 06:51:52 -0700 (PDT)
Received: from ?IPV6:2400:4050:a840:1e00:78d2:b862:10a7:d486?
 ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
 by smtp.gmail.com with ESMTPSA id
 8-20020a17090a034800b00262e485156esm14092117pjf.57.2023.08.16.06.51.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Aug 2023 06:51:52 -0700 (PDT)
Message-ID: <b1b4843e-038c-43ac-8aa0-b95312b0806a@daynix.com>
Date: Wed, 16 Aug 2023 22:51:43 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 12/24] gdbstub: Simplify XML lookup
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Mahmoud Mandour
 <ma.mandourr@gmail.com>, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 John Snow <jsnow@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Michael Rolnik
 <mrolnik@gmail.com>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Brian Cain <bcain@quicinc.com>, Song Gao <gaosong@loongson.cn>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, Laurent Vivier
 <laurent@vivier.eu>, Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>,
 Stafford Horne <shorne@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Nicholas Piggin <npiggin@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Max Filippov <jcmvbkbc@gmail.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org
References: <20230731084354.115015-1-akihiko.odaki@daynix.com>
 <20230731084354.115015-13-akihiko.odaki@daynix.com>
 <87jztxrbv0.fsf@linaro.org>
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <87jztxrbv0.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::62d;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On 2023/08/14 22:27, Alex Bennée wrote:
> 
> Akihiko Odaki <akihiko.odaki@daynix.com> writes:
> 
>> Now we know all instances of GDBFeature that is used in CPU so we can
>> traverse them to find XML. This removes the need for a CPU-specific
>> lookup function for dynamic XMLs.
>>
>> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
>> ---
>>   gdbstub/gdbstub.c | 28 +++++++++-------------------
>>   1 file changed, 9 insertions(+), 19 deletions(-)
>>
>> diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
>> index 182efe7e0f..e5bb2c89ba 100644
>> --- a/gdbstub/gdbstub.c
>> +++ b/gdbstub/gdbstub.c
>> @@ -354,8 +354,7 @@ static const char *get_feature_xml(const char *p, const char **newp,
>>                                      GDBProcess *process)
>>   {
>>       size_t len;
>> -    int i;
>> -    const char *name;
>> +    GDBRegisterState *r;
>>       CPUState *cpu = gdb_get_first_cpu_in_process(process);
>>       CPUClass *cc = CPU_GET_CLASS(cpu);
>>   
>> @@ -364,15 +363,12 @@ static const char *get_feature_xml(const char *p, const char **newp,
>>           len++;
>>       *newp = p + len;
>>   
>> -    name = NULL;
>>       if (strncmp(p, "target.xml", len) == 0) {
>>           char *buf = process->target_xml;
>>           const size_t buf_sz = sizeof(process->target_xml);
>>   
>>           /* Generate the XML description for this CPU.  */
>>           if (!buf[0]) {
>> -            GDBRegisterState *r;
>> -
>>               pstrcat(buf, buf_sz,
>>                       "<?xml version=\"1.0\"?>"
>>                       "<!DOCTYPE target SYSTEM \"gdb-target.dtd\">"
>> @@ -389,28 +385,22 @@ static const char *get_feature_xml(const char *p, const char **newp,
>>               pstrcat(buf, buf_sz, "\"/>");
>>               for (r = cpu->gdb_regs; r; r = r->next) {
>>                   pstrcat(buf, buf_sz, "<xi:include href=\"");
>> -                pstrcat(buf, buf_sz, r->feature->xml);
>> +                pstrcat(buf, buf_sz, r->feature->xmlname);
>>                   pstrcat(buf, buf_sz, "\"/>");
>>               }
>>               pstrcat(buf, buf_sz, "</target>");
>>           }
>>           return buf;
>>       }
> 
> It would be nice to modernise this code before adding to it. The static
> target_xml buffer and use of pstrcat could be replaced by GString code
> that is less sketchy.

I saw you did that yourself. Nevertheless I included my own 
implementation for the suggestion in v3. It uses 
g_markup_printf_escaped() for extra caution and better readability (i.e. 
the xi:include tags are written in a format: <xi:include href=\"%s\"/>).

> 
> 
>> -    if (cc->gdb_get_dynamic_xml) {
>> -        char *xmlname = g_strndup(p, len);
>> -        const char *xml = cc->gdb_get_dynamic_xml(cpu, xmlname);
>> -
>> -        g_free(xmlname);
>> -        if (xml) {
>> -            return xml;
>> -        }
>> +    if (strncmp(p, cc->gdb_core_feature->xmlname, len) == 0) {
>> +        return cc->gdb_core_feature->xml;
>>       }
>> -    for (i = 0; ; i++) {
>> -        name = gdb_features[i].xmlname;
>> -        if (!name || (strncmp(name, p, len) == 0 && strlen(name) == len))
>> -            break;
>> +    for (r = cpu->gdb_regs; r; r = r->next) {
>> +        if (strncmp(p, r->feature->xmlname, len) == 0) {
>> +            return r->feature->xml;
>> +        }
>>       }
>> -    return name ? gdb_features[i].xml : NULL;
>> +    return NULL;
>>   }
>>   
>>   const GDBFeature *gdb_find_static_feature(const char *xmlname)
> 
> 

