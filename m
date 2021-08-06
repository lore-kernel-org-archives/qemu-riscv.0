Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mBt1w-0004DB-MZ
	for mharc-qemu-riscv@gnu.org; Fri, 06 Aug 2021 02:08:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruinland@andestech.com>)
 id 1mBt1u-0004Cr-55; Fri, 06 Aug 2021 02:08:26 -0400
Received: from atcsqr.andestech.com ([60.248.187.195]:44082)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruinland@andestech.com>)
 id 1mBt1q-0002Ru-0W; Fri, 06 Aug 2021 02:08:25 -0400
Received: from mail.andestech.com (atcpcs16.andestech.com [10.0.1.222])
 by ATCSQR.andestech.com with ESMTP id 17667uei088304;
 Fri, 6 Aug 2021 14:07:56 +0800 (GMT-8)
 (envelope-from ruinland@andestech.com)
Received: from ATCPCS31.andestech.com (10.0.1.89) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server (TLS) id 14.3.498.0; Fri, 6 Aug 2021
 14:07:58 +0800
Received: from APC01-HK2-obe.outbound.protection.outlook.com (104.47.124.50)
 by mail.andestech.com (10.0.1.89) with Microsoft SMTP Server (TLS) id
 14.3.498.0; Fri, 6 Aug 2021 14:07:55 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UcM2SveJE/e7URB1qbTrHm61sfUTuJXK9YIpyvJ2tbBYiL2sQJwRDBuUy7lPPbve32mJhBNvVZrX2mBWzZniK19JSuA8bTAU7BT6Gxxi47MBvJZpKaGAPDo1ZVyM4ttwFRwaM6/7aRUFR+i4qIrhefOLJAETVZcKWTMUydJG0YC8ROPH9ArHCcGBbMWK6jKQzQ0A6flsjtoRdNif5A4yfakJ5uu28Q7eZPX84ofFTN/cBTDAer3VEUM6wsGXeNw8tAyqYWhPeTKBrkLhfebQWSP1YXfk4late1nW+/uuDSszv2zshd46GuWGTbiu+H/VxXP+b4DfAtKyvkrdTN3o6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+0vGMHPSdWR3+tTA2hvacfqxsvXgRZpDByC5Kfw+PuE=;
 b=KdOR3o8SFodtdgIwA2EBp9x2NS1Nlwf/L2cVVVqtwLO7ntGLB2y1MCSGx8/RkC+R7ecZ1PeWgWW/OuTuzV6wwwLjuPHQefOjTGqT7sNJF85amW+LkYnmrw2krh+lvR5PCGn7qXfpl5b2TWaOYLdXU+B9sjVPrsttcYfQfUInE9tXhKrTzdgjhH9X2KDOnc+OLHWbmpDrej44HUery9nkGYBnCB7h8p97QGhtVl6Sev9h8tjjxybxn7ooA5UQ1geIOaiERTzdCNhj7A44a/1oYu64tHqIMadg4xFcQ57tdB0efrfp+PMcIJd4IMoSlB2uRSiPxIcmHxDrZ8FhYtMWKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=andestech.com; dmarc=pass action=none
 header.from=andestech.com; dkim=pass header.d=andestech.com; arc=none
Received: from SG2PR03MB4263.apcprd03.prod.outlook.com (2603:1096:4:81::17) by
 SG2PR03MB3084.apcprd03.prod.outlook.com (2603:1096:4:a::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.12; Fri, 6 Aug 2021 06:07:48 +0000
Received: from SG2PR03MB4263.apcprd03.prod.outlook.com
 ([fe80::f08e:fed9:1286:9f03]) by SG2PR03MB4263.apcprd03.prod.outlook.com
 ([fe80::f08e:fed9:1286:9f03%6]) with mapi id 15.20.4394.015; Fri, 6 Aug 2021
 06:07:46 +0000
From: =?iso-2022-jp?B?UnVpbmxhbmQgQ2h1YW4tVHp1IFRzYSgbJEJocVEjO3EbKEIp?=
 <ruinland@andestech.com>
To: Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <Alistair.Francis@wdc.com>
CC: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>, "open
 list:RISC-V" <qemu-riscv@nongnu.org>, wangjunqiang
 <wangjunqiang@iscas.ac.cn>, Bin Meng <bin.meng@windriver.com>,
 =?iso-2022-jp?B?RHlsYW4gRGFpLVJvbmcgSmhvbmcoGyRCPmFCUk07GyhCKQ==?=
 <dylan@andestech.com>
Subject: Re: [RFC PATCH v4 2/4] Adding basic custom/vendor CSR handling
 mechanism
Thread-Topic: [RFC PATCH v4 2/4] Adding basic custom/vendor CSR handling
 mechanism
Thread-Index: AQHXiiM/yK9FqJ/gJkiIVS+WwX+SN6tl0/YAgAAmVAQ=
Date: Fri, 6 Aug 2021 06:07:46 +0000
Message-ID: <SG2PR03MB4263FC66699A8EEF805DDAF3D5F39@SG2PR03MB4263.apcprd03.prod.outlook.com>
References: <20210805175626.11573-1-ruinland@andestech.com>
 <20210805175626.11573-3-ruinland@andestech.com>,
 <CAEUhbmWXZBwvsDC5VYvQs+3zssNaRFwKz14fJPnPQHJCpwVUPg@mail.gmail.com>
In-Reply-To: <CAEUhbmWXZBwvsDC5VYvQs+3zssNaRFwKz14fJPnPQHJCpwVUPg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=andestech.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: adacc519-f53e-46c1-ec5a-08d958a08333
x-ms-traffictypediagnostic: SG2PR03MB3084:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SG2PR03MB308427937B9B47F372809AE9D5F39@SG2PR03MB3084.apcprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 34oFFmN+ebCVR7s67os7IPU2cmspbbgRpJWj/bVcjTkfdGVNTs2t9B6Gj8LKbspKBZI8SWrNMc4INU0aaIgXF8JCVUm1Dcb/4lmins69CAdXoTBbNIjXMu9+KtQYqYuTIAfzmyysSiygMEbAAMExYIBUkKbLcreNkeuzKRfIZK89ys+q9X/hQUXZZms58l3GAF+KFWcHF5loaSM44z7po0HonWVuZFycTOadeSCu/CNxR3N/c2xs8l5jfHvTzqUMnPEIsxnVSLLAWs69aRhs6gNcnu+PHiBjs9PkTU4RvNw9UHhgQpNOMwWMhEVrUTon3l2Zk9aZfoO+B9uEzaGQTX+idw3QS0OrmE3r5opAVJ5JpdNeV1W6IXyajaIvwBLSHQJjjgsoCp/19e0ISEO2xq2GN6SsSqEQmOlKy9sX5v5vdFdM2P9Q2ExZEfn6R093duF6pxDtajv9/5Ntc/ewPqJCIs79lp7WGqaJ675CSiVSFf4YsGiD5VCUbiB979fy3ukOunZbgIbUhhu/nSGiBAEmir01jSotbUnsQKgnjaP+w4sSQwyRSQd7u7kzwQYM3igM7+M0T5pXEatulnVs6L4mIjGyXusS8lKjCnPOjxMyvkNstBwiMUliUb2FpU9ZA9WIJmgCyh72NGUCtQOXvlgoHoVtYIHK8Zzaz8pnnVLnftn2gMEPCjdAPTKEaEvpQ2eGIrbJtr3JwT5k0KT0NGt1/VA1qfGhfMv5Ffq6P70=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SG2PR03MB4263.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(346002)(39830400003)(396003)(366004)(8676002)(7696005)(33656002)(66476007)(64756008)(5660300002)(66556008)(66446008)(66946007)(26005)(91956017)(186003)(76116006)(6506007)(85182001)(54906003)(508600001)(52536014)(86362001)(110136005)(83380400001)(2906002)(122000001)(316002)(4326008)(19627405001)(71200400001)(38100700002)(55016002)(107886003)(8936002)(38070700005)(9686003)(21314003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-2022-jp?B?aDlBU1BNM1Z3OHloSmR6T3Bzdm1JNWVESitIKzZraVhCR1ZOVHNnRERo?=
 =?iso-2022-jp?B?LzBJZ0FBOHdqUEVUaUhzWVdaQXFmMGtzMzduVnZRdXgvWUJaTzRkZWk5?=
 =?iso-2022-jp?B?bURrc2sySDVpSjhBQUZiQlA0R01oYXlGZyttcDk3Y09jcXBLeUJrb1RS?=
 =?iso-2022-jp?B?bCtMSXRyOFFHbjYxNWxxOVRjK0E1K2ttMHRweXAwazVzMXMrRVlnT254?=
 =?iso-2022-jp?B?cG1tSDFWZnRNRG14enFCK01sNU4yYUQyb05JODlXWUtVd2FGREwyS3FK?=
 =?iso-2022-jp?B?d29JTWlBY2tHS3VYTXVwcFhVdTdTRmtEYi9SMjMyNW96MWFwMXM2Y0Nw?=
 =?iso-2022-jp?B?UjErSWxOamVIMm85dHRMbFkwOTBYZlB3c3NIbjM5MlJZd2xQM01ZbkNO?=
 =?iso-2022-jp?B?eUQyMis0bTAxKzBVNWJPdnBkQjNCc1o2U2w0TUVEOVF4RnVXWXAxU0ht?=
 =?iso-2022-jp?B?S1lvNVlvRlFJQmpOc3d4L1JXanRpYzJjYm04aTNWUHpOYVpjWVVIQjFa?=
 =?iso-2022-jp?B?MFI5UExzU3k2Z0EyNXBMOUQ0STRyUWs0bHVGbTd4R3FRQm9ZTHgydTMw?=
 =?iso-2022-jp?B?aXVXdytUK3FHNTlTQjkwVkJzbTU4S0hqYXhiSXlIVU4xMEFFTGpQWWNl?=
 =?iso-2022-jp?B?dnFRaTFLb2EzcUptaVlWMUg4SXFvWENKZTg4T2Y4SmxJcUtHSEhDelRp?=
 =?iso-2022-jp?B?OWJnRkpDUGpFd0FUOTFoVXB4UzFhZEN5eU5Kdlc3TTR5NEE3VkhiTm5v?=
 =?iso-2022-jp?B?c3RwUVJaTkVBRU52bXQ1KzdQTkRjY1B0YWl3d1hublg4bXBkc0tWKysx?=
 =?iso-2022-jp?B?S3RSdGN3S0hFMXMyN0RxR3MyR01RaElWTEtXVDdNc3U5cGR0V3BrVnNF?=
 =?iso-2022-jp?B?NFZlOUk3TE14a3RybWdLdXY5cENhUFEwNWtNYjlsbTA1emx4anFmUS9l?=
 =?iso-2022-jp?B?Nk5IU25heVVsQmdmSHNtVTBkckxXN0U1OXdtZzBhMExWM0dSejkxZkRy?=
 =?iso-2022-jp?B?c2lnY21aM2hUWUpJUnA3LzJIdDlnN1NLZExyakRRVEJKellsVTZuaUFz?=
 =?iso-2022-jp?B?enlnanhiaHVMSGZ4VHRvWHltaVJhVXR6V2c1MVlta0E3MHBrdmtDYnJE?=
 =?iso-2022-jp?B?dlY4SENtRnl1MHJPZDVPbG5VL04vL1FkSEhrNVZnR3pSbmdJTWlRejR4?=
 =?iso-2022-jp?B?Qzl6WDZMRkdqaG85Z3NVckk5ZmU2em9sU05EMFRSejhTUCtjSlhIT0pL?=
 =?iso-2022-jp?B?VEN4WmRFTWdSbXpGaHVURHN3aU1Id1lUd3IzZzB1U2RsYWxPbUY5dGpy?=
 =?iso-2022-jp?B?UXRzRGdENU1vVFMza1haVEdiU2M0SXF3dnU4TDBBL0x3N1MvZnRZMEFw?=
 =?iso-2022-jp?B?N0VOMkFiTTIzVjRwS0ZySHo4ZDJ4ZDI0SnNWRGlJdGJrNVhPNXFycTd3?=
 =?iso-2022-jp?B?TzBYa0g2TDlvUXZTZ3pmemI0MmRXKytpSDQ0TEdzd2xxeUp2WXUycU5E?=
 =?iso-2022-jp?B?ZEZRZi94cFo3bGFZVTNTdnltY0xTSUt0U3A4cGYrdzBiWlBObFRPN1Fi?=
 =?iso-2022-jp?B?dzRSajJwa050cmRJWEtrNGtEZnBIMEt2QTBJSC9uT0NNaVpnYzJpdytz?=
 =?iso-2022-jp?B?VnhLWEhSR25kVVVJd3JhVmphOURiRnpBVEZtTXdhZkZOQ2VZOUF6K3Bw?=
 =?iso-2022-jp?B?aGF5ZUJYeVpOV0d1UWFyM0xpakUzdHZnRXB2OVRzSHlRbTdDbUFWaUpM?=
 =?iso-2022-jp?B?aXg0aDVUM3NLdmpQc2xxK2hYc3lzaFltV1cvK2p5MEJFZnF3TTNYQ1ZP?=
 =?iso-2022-jp?B?M0Y4TXBGSEU3Z2NXWFlpR0dXcmFtUkE5YWkwUUNWWXFmb09xSW9aOXpD?=
 =?iso-2022-jp?B?MWZnbGo4VmV4eXpzTG90azNyMzNBPQ==?=
Content-Type: multipart/alternative;
 boundary="_000_SG2PR03MB4263FC66699A8EEF805DDAF3D5F39SG2PR03MB4263apcp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SG2PR03MB4263.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: adacc519-f53e-46c1-ec5a-08d958a08333
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Aug 2021 06:07:46.6057 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e3ec21b7-ec6c-4041-9add-61aea8171458
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3yQi8iPQrVbXW+TzIHqGt64z55whIiUfhVa3Gj50qQ0Rz4sYUp48+OahL8rgjN+ROhPTkuKWWfqimHVz0CvBUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR03MB3084
X-OriginatorOrg: andestech.com
X-DNSRBL: 
X-MAIL: ATCSQR.andestech.com 17667uei088304
Received-SPF: pass client-ip=60.248.187.195;
 envelope-from=ruinland@andestech.com; helo=ATCSQR.andestech.com
X-Spam_score_int: 13
X-Spam_score: 1.3
X-Spam_bar: +
X-Spam_report: (1.3 / 5.0 requ) BAYES_00=-1.9, CHARSET_FARAWAY_HEADER=3.2,
 HTML_MESSAGE=0.001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Fri, 06 Aug 2021 06:08:26 -0000

--_000_SG2PR03MB4263FC66699A8EEF805DDAF3D5F39SG2PR03MB4263apcp_
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable


Hi Bin and Alistair,


>> +#if defined(CONFIG_RISCV_CUSTOM)
>> +static void setup_custom_csr(CPURISCVState *env,
>> +                             riscv_custom_csr_operations csr_map_struct=
[]
>> +                             ) {

>{ should be put to the next line, per QEMU coding convention. Please
>fix this globally in this series.

Will do

>> +
>> +    env->custom_csr_map =3D g_hash_table_new_full(g_direct_hash, \
>> +                                                g_direct_equal, \
>> +                                                NULL, NULL);

> Is it possible to juse use g_hash_table_new() directly, with both 2
> parameters being NULL, given you don't provide the destroy hooks?
> like:
>
>    env->custom_csr_map =3D g_hash_table_new(NULL, NULL);

I can try.

>> +
>> +
>> +    int i;

>nits: please move this to the beginning of this function.

Will do.

>> +    for (i =3D 0; i < MAX_CUSTOM_CSR_NUM; i++) {
>> +        if (csr_map_struct[i].csrno !=3D 0) {
>> +            g_hash_table_insert(env->custom_csr_map,
>> +                GINT_TO_POINTER(csr_map_struct[i].csrno),
>> +                &csr_map_struct[i].csr_opset);
>> +        } else {
>> +            break;

>break? I think we should continue the loop.

Please refer to Patch 4.
The table is null-ended.
Thus it's a break here.


>> +typedef struct {
>> +    int csrno;
>> +    riscv_csr_operations csr_opset;
>> +    } riscv_custom_csr_operations;

> } should be put in the beginning without space. Please fix this
> globally in this series.

Will do.

> +
> +/*
> + * The reason why we have an abstraction here is that : We could have CS=
R
> + * number M on hart A is an alias of CSR number N on hart B. So we make =
a
> + * CSR number to value address map.
> + */
> +typedef struct  {
> +    int csrno;
> +    target_ulong val;
> +    } riscv_custom_csr_vals;
> +

It looks this struct is not used by any patch in this series?

>>  /* CSR function table constants */
>>  enum {
>> -    CSR_TABLE_SIZE =3D 0x1000
>> +    CSR_TABLE_SIZE =3D 0x1000,
>> +    MAX_CUSTOM_CSR_NUM =3D 100

>To be consistent, name this to be: CUSTOM_CSR_TABLE_SIZE

Sounds reasonable.

>>  /* CSR function table */
>> +extern int andes_custom_csr_size;
>> +extern riscv_custom_csr_operations andes_custom_csr_table[MAX_CUSTOM_CS=
R_NUM];

>The above 2 should not be in this patch.
Could you elaborate a little bit more ?

>>  extern riscv_csr_operations csr_ops[CSR_TABLE_SIZE];
>>
>>  void riscv_get_csr_ops(int csrno, riscv_csr_operations *ops);
>>  void riscv_set_csr_ops(int csrno, riscv_csr_operations *ops);
>>
>> +

>This is unnecessary.
Sorry for the newline.

>> -#if !defined(CONFIG_USER_ONLY)
>> +#pragma GCC diagnostic push
>> +#pragma GCC diagnostic ignored "-Wunused-function"

>Use __attribute__((__unused__)), so we don't need to use GCC push/pop
Thanks for the tips.
Will do.

>> +/*
>> + * XXX: This is just a write stub for developing custom CSR handler,

>Remove XXX
Will do.

>> + * if the behavior of writting such CSR is not presentable in QEMU and =
doesn't

>typo: writing.

>Is that present, or presentable?

It's not a writing typo. I mean "presentable" with its literal meaning.
If we cannot demonstrate a hardware feature inside QEMU, we can just stub i=
t.


>> +#if defined(CONFIG_RISCV_CUSTOM)
>> +/* Custom CSR related routines and data structures */
>> +
>> +static gpointer is_custom_csr(CPURISCVState *env, int csrno)

>The function name suggests that the return value should be of bool
>type. Suggest we do:

>static bool is_custom_csr(CPURISCVState *env, int csrno,
>riscv_custom_csr_operations *custom_csr_ops)

Thanks for the advice, will modify it for V5.


>> +
>> +

>Unnecessary changes
Sorry for the newline.

>>  int riscv_csrrw(CPURISCVState *env, int csrno, target_ulong *ret_value,
>>                  target_ulong new_value, target_ulong write_mask)
>>  {
>>      int ret;
>>      target_ulong old_value;
>>      RISCVCPU *cpu =3D env_archcpu(env);
>> +    #if !defined(CONFIG_RISCV_CUSTOM)

>Please make sure #if starts from the beginning of this line, without space=
 ahead
Will do.

>> +    riscv_csr_operations *csrop =3D &csr_ops[csrno];

>nits: name this variable to csr_ops

It will collide with original csr_ops.
I'll change to another name.


>>
>> +#if defined(CONFIG_RISCV_CUSTOM)
>> +/* Include the custom CSR table here. */

>nits: remove the ending .
Will do.
Sorry for all these style format issues.
I must I cherry-picked a wrong before I ran checkpatch.pl.

>> +/* This file is intentionally left blank at this commit. */

>nits: remove the ending .

>%s/at/in

Will do.

>Regards,
>Bin

Thanks for the quick reply and advice.
I'll cook the v5 ASAP.

Best regards,
Ruinland
CONFIDENTIALITY NOTICE:

This e-mail (and its attachments) may contain confidential and legally priv=
ileged information or information protected from disclosure. If you are not=
 the intended recipient, you are hereby notified that any disclosure, copyi=
ng, distribution, or use of the information contained herein is strictly pr=
ohibited. In this case, please immediately notify the sender by return e-ma=
il, delete the message (and any accompanying documents) and destroy all pri=
nted hard copies. Thank you for your cooperation.

Copyright ANDES TECHNOLOGY CORPORATION - All Rights Reserved.

--_000_SG2PR03MB4263FC66699A8EEF805DDAF3D5F39SG2PR03MB4263apcp_
Content-Type: text/html; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-2022-=
jp">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
Hi Bin&nbsp;and Alistair,&nbsp;</div>
<div id=3D"divRplyFwdMsg" dir=3D"ltr">
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText"><br>
&gt;&gt; +#if defined(CONFIG_RISCV_CUSTOM)<br>
&gt;&gt; +static void setup_custom_csr(CPURISCVState *env,<br>
&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; riscv_custom_csr_operations csr_map_struct[]<b=
r>
&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; ) {<br>
<br>
&gt;{ should be put to the next line, per QEMU coding convention. Please<br=
>
&gt;fix this globally in this series.</div>
<div class=3D"PlainText"><br>
</div>
<div class=3D"PlainText">Will do<br>
<br>
&gt;&gt; +<br>
&gt;&gt; +&nbsp;&nbsp;&nbsp; env-&gt;custom_csr_map =3D g_hash_table_new_fu=
ll(g_direct_hash, \<br>
&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; g_direc=
t_equal, \<br>
&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; NULL, N=
ULL);<br>
<br>
&gt; Is it possible to juse use g_hash_table_new() directly, with both 2<br=
>
&gt; parameters being NULL, given you don't provide the destroy hooks?<br>
&gt; like:<br>
&gt;<br>
&gt;&nbsp; &nbsp; env-&gt;custom_csr_map =3D g_hash_table_new(NULL, NULL);<=
br>
<br>
</div>
<div class=3D"PlainText">I can try.<br>
<br>
&gt;&gt; +<br>
&gt;&gt; +<br>
&gt;&gt; +&nbsp;&nbsp;&nbsp; int i;<br>
<br>
&gt;nits: please move this to the beginning of this function.<br>
<br>
Will do.<br>
<br>
&gt;&gt; +&nbsp;&nbsp;&nbsp; for (i =3D 0; i &lt; MAX_CUSTOM_CSR_NUM; i++) =
{<br>
&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (csr_map_struct[i].=
csrno !=3D 0) {<br>
&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; g_hash_table_insert(env-&gt;custom_csr_map,<br>
&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; GINT_TO_POINTER(csr_map_struct[i].csrno),<br>
&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; &amp;csr_map_struct[i].csr_opset);<br>
&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else {<br>
&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; break;<br>
<br>
&gt;break? I think we should continue the loop.<br>
<br>
Please refer to Patch 4.</div>
<div class=3D"PlainText">The table is null-ended.</div>
<div class=3D"PlainText">Thus it's a break here.<br>
<br>
<br>
&gt;&gt; +typedef struct {<br>
&gt;&gt; +&nbsp;&nbsp;&nbsp; int csrno;<br>
&gt;&gt; +&nbsp;&nbsp;&nbsp; riscv_csr_operations csr_opset;<br>
&gt;&gt; +&nbsp;&nbsp;&nbsp; } riscv_custom_csr_operations;<br>
<br>
&gt; } should be put in the beginning without space. Please fix this<br>
&gt; globally in this series.<br>
<br>
Will do.<br>
<br>
&gt; +<br>
&gt; +/*<br>
&gt; + * The reason why we have an abstraction here is that : We could have=
 CSR<br>
&gt; + * number M on hart A is an alias of CSR number N on hart B. So we ma=
ke a<br>
&gt; + * CSR number to value address map.<br>
&gt; + */<br>
&gt; +typedef struct&nbsp; {<br>
&gt; +&nbsp;&nbsp;&nbsp; int csrno;<br>
&gt; +&nbsp;&nbsp;&nbsp; target_ulong val;<br>
&gt; +&nbsp;&nbsp;&nbsp; } riscv_custom_csr_vals;<br>
&gt; +<br>
<br>
It looks this struct is not used by any patch in this series?<br>
<br>
&gt;&gt;&nbsp; /* CSR function table constants */<br>
&gt;&gt;&nbsp; enum {<br>
&gt;&gt; -&nbsp;&nbsp;&nbsp; CSR_TABLE_SIZE =3D 0x1000<br>
&gt;&gt; +&nbsp;&nbsp;&nbsp; CSR_TABLE_SIZE =3D 0x1000,<br>
&gt;&gt; +&nbsp;&nbsp;&nbsp; MAX_CUSTOM_CSR_NUM =3D 100<br>
<br>
&gt;To be consistent, name this to be: CUSTOM_CSR_TABLE_SIZE<br>
<br>
</div>
<div class=3D"PlainText">Sounds reasonable.<br>
<br>
</div>
<div class=3D"PlainText">&gt;&gt;&nbsp; /* CSR function table */<br>
&gt;&gt; +extern int andes_custom_csr_size;<br>
&gt;&gt; +extern riscv_custom_csr_operations andes_custom_csr_table[MAX_CUS=
TOM_CSR_NUM];<br>
<br>
&gt;The above 2 should not be in this patch.<br>
Could you elaborate a little bit more ?<br>
<br>
&gt;&gt;&nbsp; extern riscv_csr_operations csr_ops[CSR_TABLE_SIZE];<br>
&gt;&gt;<br>
&gt;&gt;&nbsp; void riscv_get_csr_ops(int csrno, riscv_csr_operations *ops)=
;<br>
&gt;&gt;&nbsp; void riscv_set_csr_ops(int csrno, riscv_csr_operations *ops)=
;<br>
&gt;&gt;<br>
&gt;&gt; +<br>
<br>
&gt;This is unnecessary.<br>
Sorry for the newline.<br>
<br>
&gt;&gt; -#if !defined(CONFIG_USER_ONLY)<br>
&gt;&gt; +#pragma GCC diagnostic push<br>
&gt;&gt; +#pragma GCC diagnostic ignored &quot;-Wunused-function&quot;<br>
<br>
&gt;Use __attribute__((__unused__)), so we don't need to use GCC push/pop<b=
r>
Thanks for the tips.</div>
<div class=3D"PlainText">Will do.<br>
<br>
&gt;&gt; +/*<br>
&gt;&gt; + * XXX: This is just a write stub for developing custom CSR handl=
er,<br>
<br>
&gt;Remove XXX<br>
Will do.<br>
<br>
&gt;&gt; + * if the behavior of writting such CSR is not presentable in QEM=
U and doesn't<br>
<br>
&gt;typo: writing.<br>
<br>
&gt;Is that present, or presentable?</div>
<div class=3D"PlainText"><br>
</div>
<div class=3D"PlainText">It's not a writing typo. I mean &quot;presentable&=
quot; with its literal meaning.</div>
<div class=3D"PlainText">If we cannot demonstrate a hardware feature inside=
 QEMU, we can just stub it.<br>
</div>
<div class=3D"PlainText"><br>
<br>
&gt;&gt; +#if defined(CONFIG_RISCV_CUSTOM)<br>
&gt;&gt; +/* Custom CSR related routines and data structures */<br>
&gt;&gt; +<br>
&gt;&gt; +static gpointer is_custom_csr(CPURISCVState *env, int csrno)<br>
<br>
&gt;The function name suggests that the return value should be of bool<br>
&gt;type. Suggest we do:<br>
<br>
&gt;static bool is_custom_csr(CPURISCVState *env, int csrno,<br>
&gt;riscv_custom_csr_operations *custom_csr_ops)</div>
<div class=3D"PlainText"><br>
</div>
<div class=3D"PlainText">Thanks for the advice, will modify it for V5.<br>
<br>
<br>
&gt;&gt; +<br>
&gt;&gt; +<br>
<br>
&gt;Unnecessary changes</div>
<div class=3D"PlainText">Sorry for the newline.<br>
<br>
&gt;&gt;&nbsp; int riscv_csrrw(CPURISCVState *env, int csrno, target_ulong =
*ret_value,<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; target_ulong new_value, target_ulong wr=
ite_mask)<br>
&gt;&gt;&nbsp; {<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ret;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; target_ulong old_value;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; RISCVCPU *cpu =3D env_archcpu(env);<=
br>
&gt;&gt; +&nbsp;&nbsp;&nbsp; #if !defined(CONFIG_RISCV_CUSTOM)<br>
<br>
&gt;Please make sure #if starts from the beginning of this line, without sp=
ace ahead<br>
Will do.<br>
<br>
&gt;&gt; +&nbsp;&nbsp;&nbsp; riscv_csr_operations *csrop =3D &amp;csr_ops[c=
srno];<br>
<br>
&gt;nits: name this variable to csr_ops<br>
<br>
It will collide with original csr_ops.</div>
<div class=3D"PlainText">I'll change to&nbsp;another name.<br>
<br>
<br>
&gt;&gt;<br>
&gt;&gt; +#if defined(CONFIG_RISCV_CUSTOM)<br>
&gt;&gt; +/* Include the custom CSR table here. */<br>
<br>
&gt;nits: remove the ending .<br>
Will do.</div>
<div class=3D"PlainText">Sorry for all these style format issues.<br>
</div>
<div class=3D"PlainText">I must I cherry-picked a wrong before I ran checkp=
atch.pl.<br>
<br>
&gt;&gt; +/* This file is intentionally left blank at this commit. */<br>
<br>
&gt;nits: remove the ending .<br>
<br>
&gt;%s/at/in</div>
<div class=3D"PlainText"><br>
</div>
<div class=3D"PlainText">Will do.<br>
<br>
&gt;Regards,<br>
&gt;Bin<br>
</div>
<div class=3D"PlainText"><br>
</div>
<div class=3D"PlainText">Thanks for the quick reply and advice.</div>
<div class=3D"PlainText">I'll cook the v5 ASAP.</div>
<div class=3D"PlainText"><br>
</div>
<div class=3D"PlainText">Best regards,</div>
<div class=3D"PlainText">Ruinland</div>
</span></font></div>
<div style=3D"background-color:#D5EAFF; border:1px dotted #003333; padding:=
.8em; ">
<span style=3D"font-size:12pt;  font-family: 'Cambria','times new roman','g=
aramond',serif; color:#ff0000;">CONFIDENTIALITY NOTICE:</span><br>
<p style=3D"font-size:11pt; line-height:10pt; font-family: 'Cambria','times=
 roman',serif;">
This e-mail (and its attachments) may contain confidential and legally priv=
ileged information or information protected from disclosure. If you are not=
 the intended recipient, you are hereby notified that any disclosure, copyi=
ng, distribution, or use of the
 information contained herein is strictly prohibited. In this case, please =
immediately notify the sender by return e-mail, delete the message (and any=
 accompanying documents) and destroy all printed hard copies. Thank you for=
 your cooperation.
</p>
<span style=3D"font-size:12pt;  font-family: 'Cambria','times new roman','g=
aramond',serif; color:#ff0000;">Copyright ANDES TECHNOLOGY CORPORATION - Al=
l Rights Reserved.</span><br>
</div>
</body>
</html>

--_000_SG2PR03MB4263FC66699A8EEF805DDAF3D5F39SG2PR03MB4263apcp_--

